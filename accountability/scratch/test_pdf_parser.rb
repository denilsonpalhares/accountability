# Script de teste para PdfParserService
require File.expand_path('../../config/environment', __FILE__)

file_to_test = Rails.root.join('data', 'sicoob_2026_1.pdf')

if File.exist?(file_to_test)
  puts "Analisando arquivo: #{file_to_test}"
  parser = PdfParserService.new(file_to_test)
  result = parser.parse
  
  puts "\n--- CONFIGURAÇÃO ENCONTRADA ---"
  puts result[:config].inspect
  
  puts "\n--- ARQUIVO JSON GERADO ---"
  puts "Caminho: #{result[:json_path]}"
  
  puts "\n--- LANÇAMENTOS EXTRAÍDOS (Primeiros 10) ---"
  result[:entries].first(10).each do |entry|
    puts "Data: #{entry[:date]} | Natureza: #{entry[:nature]} | Valor: #{entry[:value]} | Desc: #{entry[:description]}"
  end
  
  puts "\nTotal de lançamentos encontrados: #{result[:entries].size}"
else
  puts "Arquivo não encontrado: #{file_to_test}"
end
