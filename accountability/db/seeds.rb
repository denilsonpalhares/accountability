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
      "1.1.3" => { name: "INVESTIMENTOS", type: "ASSET", nature: "DEBIT", analytic: false, alias: "investimentos", children: {
        "1.1.3.1" => { name: "POOL", type: "ASSET", nature: "DEBIT", analytic: true, alias: "pool" },
        "1.1.3.2" => { name: "GERALDO", type: "ASSET", nature: "DEBIT", analytic: false, alias: "geraldo", children: {
          "1.1.3.2.1" => { name: "APARTAMENTO", type: "ASSET", nature: "DEBIT", analytic: true, alias: "apartamento_geraldo" },
          "1.1.3.2.2" => { name: "MARACUJA", type: "ASSET", nature: "DEBIT", analytic: true, alias: "maracuja_geraldo" }
        }}
      }}
    }}
  }},
  "2" => { name: "PASSIVO", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "passivo", children: {
    "2.1" => { name: "DISPONIVEL", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "passivo_disponivel", children: {
      "2.1.1" => { name: "CARTOES", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "cartoes", children: {
        "2.1.1.1" => { name: "CARTAO SICOOB", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "cartao_sicoob" },
        "2.1.1.2" => { name: "CARTAO NUBANK", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "cartao_nubank" }
      }}
    }},
    "2.2" => { name: "FAMILIARES", type: "LIABILITY", nature: "CREDIT", analytic: false, alias: "familiares", children: {
      "2.2.1" => { name: "FILLIPE PEREIRA PALHARES", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "fillipe_palhares" }
    }}
  }},
  "4" => { name: "RECEITAS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "receitas", children: {
    "4.1" => { name: "SALARIOS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "salarios", children: {
      "4.1.1" => { name: "CONFECCOES VIEGAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_alfenas" },
      "4.1.2" => { name: "CARVALHO COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_congonhas" },
      "4.1.3" => { name: "IGOR COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lafaiete2" },
      "4.1.4" => { name: "MALUCAO NOVA SERRANA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_nova_serrana" },
      "4.1.5" => { name: "CONFECCOES LUCAS PIRES LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lafaiete" },
      "4.1.6" => { name: "JULIA RODRIGUES COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_ouro_branco" },
      "4.1.7" => { name: "LAURA COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_mariana" },
      "4.1.8" => { name: "MAGAZINE PARA DE MINAS", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_para_de_minas" },
      "4.1.9" => { name: "BETIM", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_betim" }
    }},
    "4.2" => { name: "FREE-LANCERS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "freelancers", children: {
      "4.2.1" => { name: "PROSISCO", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "prosisco" }
    }}
  }},
  "5" => { name: "DESPESAS", type: "EXPENSE", nature: "DEBIT", analytic: false, alias: "despesas", children: {
    "5.1" => { name: "IMPOSTOS", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "impostos" },
    "5.2" => { name: "ENERGIA ELETRICA", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "energia_eletrica" },
    "5.3" => { name: "Ingles", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "ingles" },
    "5.4" => { name: "Agua", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "agua" },
    "5.5" => { name: "INTERNET", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "internet" },
    "5.6" => { name: "DENILSON PESSOAL", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "denilson_pessoal" },
    "5.7" => { name: "Unimed", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "unimed" },
    "5.8" => { name: "Carro", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "carro" },
    "5.9" => { name: "Casa", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "casa" },
    "5.10" => { name: "Compras", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "compras" }
  }}
}

def create_accounts(entity, tree, parent = nil)
  tree.each do |code, data|
    account = Account.find_or_create_by!(entity: entity, code: code) do |a|
      a.name = data[:name]
      a.account_type = data[:type]
      a.nature = data[:nature]
      a.is_analytic = data[:analytic]
      a.alias = data[:alias]
      a.parent = parent
    end

    # Se a conta já existir, garante que o alias seja atualizado
    account.update!(alias: data[:alias]) if account.alias != data[:alias]

    create_accounts(entity, data[:children], account) if data[:children]
  end
end

create_accounts(denilson, accounts_tree)

journal_entries_data = [
  {
    date: "2026-01-05",
    description: "CRED.TR.CT.INTERCRE",
    reference: "3180",
    status: "POSTED",
    lines: [
      { account_alias: "sicoob", value: 90000, nature: "DEBIT" },
      { account_alias: "salario_alfenas", value: 90000, nature: "CREDIT" }
    ]
  }
]

def create_journal_entries(entity, entries)
  entries.each do |data|
    journal = JournalEntry.find_or_create_by!(entity: entity, date: data[:date], reference: data[:reference]) do |j|
      j.description = data[:description]
      j.status = data[:status]
    end

    data[:lines].each do |line_data|
      account = Account.find_by!(entity: entity, alias: line_data[:account_alias])
      EntryLine.find_or_create_by!(journal_entry: journal, account: account) do |l|
        l.value = line_data[:value]
        l.nature = line_data[:nature]
      end
    end
  end
end

create_journal_entries(denilson, journal_entries_data)
