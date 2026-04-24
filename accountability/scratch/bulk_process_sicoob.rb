# Script para processamento em lote dos PDFs do Sicoob
require File.expand_path('../../config/environment', __FILE__)

data_dir = Rails.root.join('data')

puts "Iniciando processamento em lote na pasta: #{data_dir}"
result = TransactionParserService.bulk_process(data_dir, pattern: "*sicoob*.*")

puts "\nProcessamento concluído!"
puts "Total de lançamentos únicos: #{result[:total_found]}"
puts "Arquivo gerado: #{result[:output_path]}"

# Mostra as primeiras 5 linhas do JSON gerado
puts "\n--- PRIMEIROS LANÇAMENTOS DO sicoob.json ---"
system("head -n 25 #{result[:output_path]}")
