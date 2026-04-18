# Arquivo de testes e simulações para o Modelo Contábil
# Este arquivo serve de base (seed ou pseudo-código ActiveRecord) para validar os cenários documentados.

# 1. SETUP INICIAL DA ENTIDADE E CONTAS
entity = Entity.create!(
  name: 'Empresa Tecnologia SA',
  document: '12.345.678/0001-99',
  entity_type: 'PJ',
  currency: 'BRL'
)

# Centros de Custo
cc_ti = CostCenter.create!(entity: entity, code: '1.01', name: 'Tecnologia', is_active: true)
cc_vendas = CostCenter.create!(entity: entity, code: '1.02', name: 'Vendas', is_active: true)

# Plano de Contas
sicoob = Account.create!(entity: entity, code: '1.1.1.01', name: 'Sicoob', account_type: 'ASSET', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'NONE')

nubank = Account.create!(entity: entity, code: '1.1.1.02', name: 'Nubank', account_type: 'ASSET', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'NONE')

caixa = Account.create!(entity: entity, code: '1.1.1.03', name: 'Caixa', account_type: 'ASSET', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'NONE')


compras = Account.create!(entity: entity, code: '3.1.1.01', name: 'Compras', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

carne = Account.create!(entity: entity, code: '3.1.1.02', name: 'Carne', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

pao = Account.create!(entity: entity, code: '3.1.1.03', name: 'Pão', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

farm = Account.create!(entity: entity, code: '3.1.1.04', name: 'Farmácia', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

katara = Account.create!(entity: entity, code: '3.1.1.05', name: 'Katara', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

rg = Account.create!(entity: entity, code: '3.1.1.06', name: 'RG', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

aikido = Account.create!(entity: entity, code: '3.1.1.07', name: 'Aikido', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

gasolina = Account.create!(entity: entity, code: '3.1.1.08', name: 'Gasolina', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

sf = Account.create!(entity: entity, code: '3.1.1.09', name: 'SF', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

agua = Account.create!(entity: entity, code: '3.1.1.10', name: 'Água', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

luz = Account.create!(entity: entity, code: '3.1.1.11', name: 'Luz', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

unimed = Account.create!(entity: entity, code: '3.1.1.12', name: 'Unimed', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

carro = Account.create!(entity: entity, code: '3.1.1.13', name: 'Carro', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

netflix = Account.create!(entity: entity, code: '3.1.1.14', name: 'Netflix', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

internet = Account.create!(entity: entity, code: '3.1.1.15', name: 'Internet', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

seguros = Account.create!(entity: entity, code: '3.1.1.16', name: 'Seguros', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

ingles = Account.create!(entity: entity, code: '3.1.1.17', name: 'Inglês', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

celular = Account.create!(entity: entity, code: '3.1.1.18', name: 'Celular', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

pessoal = Account.create!(entity: entity, code: '3.1.1.19', name: 'Pessoal', account_type: 'EXPENSE', nature: 'DEBIT', is_analytic: true, quantity_mode: 'NONE', due_mode: 'NONE', cost_center_mode: 'REQUIRED')

puts"Pagamento de imposto do carro em 01/03/2026 no valor de 138.96 no Sicoob"
journal_carro = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Imposto do carro',  status: 'POSTED')
journal_carro.entry_lines.create!(  account: sicoob,  amount: 138.96,  nature: 'CREDIT')
journal_carro.entry_lines.create!(  account: carro,  amount: 138.96,  nature: 'DEBIT')

puts "Pix pessoal em 01/03/2026 no valor de 50.00 do Sicoob para o despesa pessoal"
journal_pix = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Pix pessoal',  status: 'POSTED')
journal_pix.entry_lines.create!(  account: sicoob,  amount: 50.00,  nature: 'CREDIT')
journal_pix.entry_lines.create!(  account: pessoal,  amount: 50.00,  nature: 'DEBIT')

puts "Pagamento de imposto do carro em 01/03/2026 no valor de 80.40 no Sicoob"
journal_carro = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Imposto do carro',  status: 'POSTED')
journal_carro.entry_lines.create!(  account: sicoob,  amount: 80.40,  nature: 'CREDIT')
journal_carro.entry_lines.create!(  account: carro,  amount: 80.40,  nature: 'DEBIT')

puts "Pagamento Luz para cemig em 01/03/206 no valor de 141.26 no Sicoob"
journal_luz = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Luz',  status: 'POSTED')
journal_luz.entry_lines.create!(  account: sicoob,  amount: 141.26,  nature: 'CREDIT')
journal_luz.entry_lines.create!(  account: luz,  amount: 141.26,  nature: 'DEBIT')

puts "Pagamento	internet	internet		99.90 no Sicoob"
journal_internet = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Internet',  status: 'POSTED')
journal_internet.entry_lines.create!(  account: sicoob,  amount: 99.90,  nature: 'CREDIT')
journal_internet.entry_lines.create!(  account: internet,  amount: 99.90,  nature: 'DEBIT')

puts "Pagamento	agua	agua		682.25 no Sicoob"
journal_agua = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Água',  status: 'POSTED')
journal_agua.entry_lines.create!(  account: sicoob,  amount: 682.25,  nature: 'CREDIT')
journal_agua.entry_lines.create!(  account: agua,  amount: 682.25,  nature: 'DEBIT')

puts "Pagamento	pessoal	rpg		21.50 no Sicoob"
journal_rpg = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'RPG',  status: 'POSTED')
journal_rpg.entry_lines.create!(  account: sicoob,  amount: 21.50,  nature: 'CREDIT')
journal_rpg.entry_lines.create!(  account: rpg,  amount: 21.50,  nature: 'DEBIT')

puts "Pagamento	TRF	cta-nubank	650.00 no Sicoob"
journal_trf = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'TRF',  status: 'POSTED')
journal_trf.entry_lines.create!(  account: sicoob,  amount: 650.00,  nature: 'CREDIT')
journal_trf.entry_lines.create!(  account: trf,  amount: 650.00,  nature: 'DEBIT')

puts "Pagamento	receita	procisco	937.50 no Sicoob"
journal_receita = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Receita',  status: 'POSTED')
journal_receita.entry_lines.create!(  account: sicoob,  amount: 937.50,  nature: 'CREDIT')
journal_receita.entry_lines.create!(  account: receita,  amount: 937.50,  nature: 'DEBIT')

puts "Pagamento	emprestimo	cta-fillipe	1,050.00 no Sicoob"
journal_emprestimo = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Empréstimo',  status: 'POSTED')
journal_emprestimo.entry_lines.create!(  account: sicoob,  amount: 1050.00,  nature: 'CREDIT')
journal_emprestimo.entry_lines.create!(  account: emprestimo,  amount: 1050.00,  nature: 'DEBIT')

puts "Pagamento	TRF	cta-fillipe	287.00 no Sicoob"
journal_trf_fillipe = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'TRF',  status: 'POSTED')
journal_trf_fillipe.entry_lines.create!(  account: sicoob,  amount: 287.00,  nature: 'CREDIT')
journal_trf_fillipe.entry_lines.create!(  account: trf,  amount: 287.00,  nature: 'DEBIT')

puts "Pagamento	TRF	cta-vinicius	287.00 no Sicoob"
journal_trf_vinicius = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'TRF',  status: 'POSTED')
journal_trf_vinicius.entry_lines.create!(  account: sicoob,  amount: 287.00,  nature: 'CREDIT')
journal_trf_vinicius.entry_lines.create!(  account: trf,  amount: 287.00,  nature: 'DEBIT')

puts "Pagamento	TRF	cta-thais	287.00 no Sicoob"
journal_trf_thais = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'TRF',  status: 'POSTED')
journal_trf_thais.entry_lines.create!(  account: sicoob,  amount: 287.00,  nature: 'CREDIT')
journal_trf_thais.entry_lines.create!(  account: trf,  amount: 287.00,  nature: 'DEBIT')

puts "Pagamento	Investimento	consorcio	287.00 no Sicoob"
journal_investimento = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Investimento',  status: 'POSTED')
journal_investimento.entry_lines.create!(  account: sicoob,  amount: 287.00,  nature: 'CREDIT')
journal_investimento.entry_lines.create!(  account: investimento,  amount: 287.00,  nature: 'DEBIT')

puts "Pagamento	carro	multa carro	176.09 no Sicoob"
journal_multa = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'Multa carro',  status: 'POSTED')
journal_multa.entry_lines.create!(  account: sicoob,  amount: 176.09,  nature: 'CREDIT')
journal_multa.entry_lines.create!(  account: multa,  amount: 176.09,  nature: 'DEBIT')

puts "Pagamento	TRF	cta-cartao	560.31 no Sicoob"
journal_trf_cartao = JournalEntry.create!(  entity: entity,  date: Date.new(2026, 3, 1),  description: 'TRF',  status: 'POSTED')
journal_trf_cartao.entry_lines.create!(  account: sicoob,  amount: 560.31,  nature: 'CREDIT')
journal_trf_cartao.entry_lines.create!(  account: trf,  amount: 560.31,  nature: 'DEBIT')
