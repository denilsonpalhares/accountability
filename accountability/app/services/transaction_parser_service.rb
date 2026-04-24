require 'pdf-reader'
require 'digest'

class TransactionParserService
  def initialize(file_path)
    @file_path = file_path
    @mapping = load_mapping
    @extension = File.extname(file_path).downcase
  end

  def parse
    return nil unless File.exist?(@file_path)

    text = extract_text
    file_config = find_mapping
    
    entries = if @extension == '.txt'
                extract_transactions_from_txt(text, file_config)
              else
                extract_transactions_from_pdf(text, file_config)
              end
    
    JSON.pretty_generate(entries)
  end

  def entries_data
    return [] unless File.exist?(@file_path)
    text = extract_text
    file_config = find_mapping
    if @extension == '.txt'
      extract_transactions_from_txt(text, file_config)
    else
      extract_transactions_from_pdf(text, file_config)
    end
  end

  def self.bulk_process(directory_path, pattern: "sicoob*.*", output_filename: "sicoob.json")
    all_entries = []
    seen_keys = Set.new

    Dir.glob(File.join(directory_path, pattern)).sort.each do |file|
      next unless ['.pdf', '.txt'].include?(File.extname(file).downcase)
      
      parser = new(file)
      entries = parser.entries_data
      
      entries.each do |entry|
        # Chave para evitar duplicados: data + descrição + valor + natureza
        key = [entry[:date], entry[:description], entry[:value], entry[:nature]].join('|')
        
        unless seen_keys.include?(key)
          all_entries << entry
          seen_keys.add(key)
        end
      end
    end

    output_path = File.join(directory_path, output_filename)
    File.write(output_path, JSON.pretty_generate(all_entries.sort_by { |e| e[:date] }))
    
    {
      total_found: all_entries.size,
      output_path: output_path
    }
  end

  private

  def extract_text
    return File.read(@file_path) if @extension == '.txt'

    text = ""
    reader = PDF::Reader.new(@file_path)
    reader.pages.each do |page|
      text << page.text
      text << "\n"
    end
    text
  end

  def load_mapping
    config_path = Rails.root.join('data', 'mapping.yml')
    return {} unless File.exist?(config_path)
    YAML.load_file(config_path)
  end

  def find_mapping
    filename = File.basename(@file_path)
    @mapping['mappings']&.find do |m|
      File.fnmatch(m['pattern'], filename)
    end
  end

  def find_counter_account(description)
    return nil unless @mapping['description_mappings']
    
    @mapping['description_mappings'].each do |acc_alias, patterns|
      if patterns.is_a?(Array)
        return acc_alias if patterns.any? { |p| description.include?(p) }
      elsif patterns.is_a?(String)
        return acc_alias if description.include?(patterns)
      end
    end
    nil
  end

  def extract_transactions_from_pdf(text, config)
    lines = text.split("\n").map(&:strip).reject(&:empty?)
    transactions = []
    
    year_match = File.basename(@file_path).match(/(\d{4})/)
    year = year_match ? year_match[1] : Time.now.year.to_s

    i = 0
    while i < lines.size
      line = lines[i]
      
      # Regex para o cabeçalho da transação: DD/MM Descrição Valor[D/C]
      if line =~ %r{^(\d{2}/\d{2})\s+(.*?)\s+([-+]?\d{1,3}(?:\.\d{3})*,\d{2})([DC])?$}
        date_dm = $1
        description = $2.strip
        value_str = $3
        suffix = $4
        
        i += 1
        details = []
        
        # Lookahead: captura as próximas linhas que NÃO começam com data DD/MM
        while i < lines.size && lines[i] !~ %r{^\d{2}/\d{2}\s+}
          details << lines[i]
          i += 1
        end

        next if description.include?("SALDO DO DIA") || description.include?("SALDO ANTERIOR")

        value_cents = (value_str.gsub('.', '').gsub(',', '.').to_f * 100).round.abs
        
        nature = if suffix == 'D'
                   'CREDIT'
                 elsif suffix == 'C'
                   'DEBIT'
                 else
                   'DEBIT'
                 end

        full_details = details.join(" | ")
        counter_acc = find_counter_account(description) || find_counter_account(full_details)

        # Se tiver CNPJ/CPF nos detalhes, vamos tentar normalizar
        # Regex flexível para CPF/CNPJ com pontos, traços, barras ou espaços
        doc_match = full_details.match(/(\d{2,3}[\.\s]\d{3}[\.\s]\d{3}[\/\s]\d{4}[-\s]\d{2}|\d{3}[\.\s]\d{3}[\.\s]\d{3}[-\s]\d{2})/)
        document = doc_match ? doc_match[0] : nil

        transaction_id = Digest::SHA256.hexdigest("#{Date.parse("#{date_dm}/#{year}")}|#{description}|#{value_cents}|#{nature}|#{counter_acc}|#{full_details}")[0..12]

        transactions << {
          id: transaction_id,
          date: Date.parse("#{date_dm}/#{year}"),
          description: description,
          details: full_details,
          document: document,
          value: value_cents,
          nature: nature,
          account_alias: config&.dig('account_alias') || 'sicoob',
          counter_account: counter_acc,
          raw_line: line
        }
      else
        i += 1
      end
    end
    transactions
  end

  def extract_transactions_from_txt(text, config)
    lines = text.split("\n").map(&:strip).reject(&:empty?)
    transactions = []

    lines.each do |line|
      parts = line.split(',').map(&:strip)
      next if parts.size < 3

      date_str = parts[0]
      description = parts[1]
      
      value_part = parts.find { |p| p =~ /^-?\d+$/ }
      next unless value_part

      value_cents = value_part.to_i.abs
      nature = value_part.to_i < 0 ? 'DEBIT' : 'CREDIT'

      is_card = config&.dig('account_alias') == 'cartao_sicoob' || File.basename(@file_path).include?('cartao')
      if is_card
         nature = value_part.to_i < 0 ? 'DEBIT' : 'CREDIT'
      end

      # Alias da conta no TXT é a contra-conta padrão, mas podemos sobrescrever se houver mapeamento de descrição
      txt_counter_acc = parts[parts.index(value_part) - 1] rescue 'desconhecido'
      counter_acc = find_counter_account(description) || txt_counter_acc
      
      main_acc = config&.dig('account_alias') || 'desconhecido'

      transaction_id = Digest::SHA256.hexdigest("#{date_str}|#{description}|#{value_cents}|#{nature}|#{counter_acc}")[0..12]

      transactions << {
        id: transaction_id,
        date: Date.parse(date_str),
        description: description,
        value: value_cents,
        nature: nature,
        account_alias: main_acc,
        counter_account: counter_acc,
        raw_line: line
      }
    rescue => e
      next
    end
    transactions
  end
end
