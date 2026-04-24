# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Entity.find_or_create_by!(name: "Denilson") do |entity|
  entity.entity_type = "PF"
  entity.currency = "BRL"
  entity.document = "00000000000" # Placeholder
end

denilson = Entity.find_by!(name: "Denilson")

accounts_tree = {
  "1" => { name: "ATIVO", type: "ASSET", nature: "DEBIT", analytic: false, alias: "ativo", children: {
    "1.1" => { name: "DISPONIVEL", type: "ASSET", nature: "DEBIT", analytic: false, alias: "disponivel", children: {
      "1.1.1" => { name: "CAIXAS", type: "ASSET", nature: "DEBIT", analytic: false, alias: "caixas", children: {
        "1.1.1.1" => { name: "CAIXA", type: "ASSET", nature: "DEBIT", analytic: true, alias: "caixa_geral" },
        "1.1.1.2" => { name: "SICOOB", type: "ASSET", nature: "DEBIT", analytic: true, alias: "sicoob" },
        "1.1.1.3" => { name: "NUBANK", type: "ASSET", nature: "DEBIT", analytic: true, alias: "nubank" }
      }},
      "1.1.2" => { name: "INVESTIMENTOS", type: "ASSET", nature: "DEBIT", analytic: false, alias: "investimentos", children: {
        "1.1.2.1" => { name: "POOL", type: "ASSET", nature: "DEBIT", analytic: true, alias: "pool" },
        "1.1.2.2" => { name: "GERALDO", type: "ASSET", nature: "DEBIT", analytic: false, alias: "", children: {
          "1.1.2.2.1" => { name: "APARTAMENTO", type: "ASSET", nature: "DEBIT", analytic: true, alias: "apartamento_geraldo" },
          "1.1.2.2.2" => { name: "MARACUJA", type: "ASSET", nature: "DEBIT", analytic: true, alias: "maracuja_geraldo" }
        }},
        "1.1.2.3" => { name: "COINBASE", type: "ASSET", nature: "DEBIT", analytic: true, alias: "coinbase" }
      }}
    }},
    "1.2" => { name: "INDISPONIVEL", type: "ASSET", nature: "DEBIT", analytic: false, alias: "indisponivel", children: {
      "1.2.1" => { name: "ELETROELETRONICOS", type: "ASSET", nature: "DEBIT", analytic: true, alias: "eletro-eletronicos" },
    }}
  }},
  "2" => { name: "PASSIVO", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "passivo", children: {
    "2.1" => { name: "CIRCULANTE", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "passivo_circulante", children: {
      "2.1.1" => { name: "CARTOES", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "cartoes", children: {
        "2.1.1.1" => { name: "CARTAO SICOOB", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "cartao_sicoob" },
        "2.1.1.2" => { name: "CARTAO NUBANK", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "cartao_nubank" }
      }}
    }},
    "2.2" => { name: "FAMILIARES", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "familiares", children: {
      "2.2.1" => { name: "FILLIPE PEREIRA PALHARES", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "fillipe_palhares" },
      "2.2.2" => { name: "VINICIUS", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "vinicius" }
    }}
  }},
  "3" => { name: "RECEITAS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "receitas", children: {
    "3.1" => { name: "SALARIOS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "salarios", children: {
      "3.1.1" => { name: "JOSE MARIA", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "jose_maria", children: {
        "3.1.1.1" => { name: "LAVRAS", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lavras" },
        "3.1.1.4" => { name: "CONFECCOES VIEGAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_alfenas" },
      }},
      "3.1.2" => { name: "GERALDO", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "geraldo", children: {
        "3.1.2.1" => { name: "CONFECCOES PIRES LAGE", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_itauna" },
        "3.1.2.2" => { name: "MALUCAO NOVA SERRANA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_nova_serrana" },
        "3.1.2.3" => { name: "CONFECCOES LUCAS PIRES LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lafaiete" },
        "3.1.2.4" => { name: "LAURA COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_mariana" },
        "3.1.2.6" => { name: "CARVALHO COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_congonhas" },
        "3.1.2.7" => { name: "IGOR COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lafaiete2" },
        "3.1.2.8" => { name: "IAGO COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_betim" },
        "3.1.2.9" => { name: "MAGAZINE PARA DE MINAS", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_parademinas" },
        
      }},
      "3.1.3" => { name: "EDERSON", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "ederson", children: {
        "3.1.3.10" => { name: "JULIA RODRIGUES COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_ouro_branco" },
        "3.1.3.11" => { name: "JG COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_ouro_branco2" }
      }}
    }},
    "3.2" => { name: "FREE-LANCERS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "freelancers", children: {
      "3.2.1" => { name: "PROSISCO", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "prosisco" }
      "3.2.2" => { name: "ACSIV", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "acsiv" }
    }}
  }},
  "4" => { name: "DESPESAS", type: "EXPENSE", nature: "DEBIT", analytic: false, alias: "despesas", children: {
    "4.1" => { name: "IMPOSTOS", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "imposto" },
    "4.2" => { name: "ENERGIA ELETRICA", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "energia" },
    "4.3" => { name: "Ingles", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "ingles" },
    "4.4" => { name: "Agua", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "agua" },
    "4.5" => { name: "INTERNET", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "internet" },
    "4.6" => { name: "DENILSON PESSOAL", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "denilson_pessoal" },
    "4.7" => { name: "Unimed", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "unimed" },
    "4.8" => { name: "Carro", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "carro" },
    "4.9" => { name: "CASA", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "casa" },
    "4.10" => { name: "COMPRAS", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "compras" },
    "4.11" => { name: "Celular", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "celular" },
    "4.12" => { name: "Combustivel", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "combustivel" },
    "4.13" => { name: "Sexta Feliz", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "sff" },
    "4.14" => { name: "Netflix", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "netflix" },
    "4.15" => { name: "Banco", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "banco" },
    "4.16" => { name: "Juros", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "juros" },
    "4.17" => { name: "Desconhecido", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "desconhecido" },
    
    
  }}
}

def create_accounts(entity, tree, parent = nil)
  tree.each do |code, data|
    # Tenta encontrar pelo alias primeiro, depois pelo código
    account = Account.find_by(entity: entity, alias: data[:alias]) || 
              Account.find_by(entity: entity, code: code) || 
              Account.new(entity: entity)
    
    account.assign_attributes(
      entity: entity,
      code: code,
      name: data[:name],
      account_type: data[:type],
      nature: data[:nature],
      is_analytic: data[:analytic],
      alias: data[:alias],
      parent: parent
    )
    
    account.save!
    create_accounts(entity, data[:children], account) if data[:children]
  end
end

create_accounts(denilson, accounts_tree)


journal_entries_data = [
]

def create_journal_entries(entity, entries)
  entries.each do |data|
    # Busca por data e referência para evitar duplicatas básicas
    journal = JournalEntry.find_or_create_by!(entity: entity, date: data[:date], reference: data[:reference]) do |j|
      j.description = data[:description]
      j.status = data[:status]
    end

    data[:lines].each do |line_data|
      account = Account.find_by!(entity: entity, alias: line_data[:account_alias])
      # Garante que a linha existe e está correta
      EntryLine.find_or_create_by!(journal_entry: journal, account: account, nature: line_data[:nature]) do |l|
        l.value = line_data[:value]
      end
    end
  end
end

create_journal_entries(denilson, journal_entries_data)
