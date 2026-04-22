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
        "1.1.2.2" => { name: "GERALDO", type: "ASSET", nature: "DEBIT", analytic: false, alias: "geraldo", children: {
          "1.1.2.2.1" => { name: "APARTAMENTO", type: "ASSET", nature: "DEBIT", analytic: true, alias: "apartamento_geraldo" },
          "1.1.2.2.2" => { name: "MARACUJA", type: "ASSET", nature: "DEBIT", analytic: true, alias: "maracuja_geraldo" }
        }}
      }}
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
      "2.2.1" => { name: "FILLIPE PEREIRA PALHARES", type: "LIABILITY", nature: "CREDIT", analytic: true, alias: "fillipe_palhares" }
    }}
  }},
  "4" => { name: "RECEITAS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "receitas", children: {
    "4.1" => { name: "SALARIOS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "salarios", children: {
      "4.1.1" => { name: "CONFECCOES VIEGAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_ricardo" },
      "4.1.2" => { name: "CARVALHO COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_congonhas" },
      "4.1.3" => { name: "IGOR COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lafaiete2" },
      "4.1.4" => { name: "MALUCAO NOVA SERRANA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_nova_serrana" },
      "4.1.5" => { name: "CONFECCOES LUCAS PIRES LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_lafaiete" },
      "4.1.6" => { name: "JULIA RODRIGUES COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_ouro_branco" },
      "4.1.7" => { name: "LAURA COMERCIO DE ROUPAS LTDA", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_mariana" },
      "4.1.8" => { name: "MAGAZINE PARA DE MINAS", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_parademinas" },
      "4.1.9" => { name: "BETIM", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "salario_betim" }
    }},
    "4.2" => { name: "FREE-LANCERS", type: "REVENUE", nature: "CREDIT", analytic: false, alias: "freelancers", children: {
      "4.2.1" => { name: "PROSISCO", type: "REVENUE", nature: "CREDIT", analytic: true, alias: "prosisco" }
    }}
  }},
  "5" => { name: "DESPESAS", type: "EXPENSE", nature: "DEBIT", analytic: false, alias: "despesas", children: {
    "5.1" => { name: "IMPOSTOS", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "imposto" },
    "5.2" => { name: "ENERGIA ELETRICA", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "energia" },
    "5.3" => { name: "Ingles", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "ingles" },
    "5.4" => { name: "Agua", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "agua" },
    "5.5" => { name: "INTERNET", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "internet" },
    "5.6" => { name: "DENILSON PESSOAL", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "denilson_pessoal" },
    "5.7" => { name: "Unimed", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "unimed" },
    "5.8" => { name: "Carro", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "carro" },
    "5.9" => { name: "CASA", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "casa" },
    "5.10" => { name: "COMPRAS", type: "EXPENSE", nature: "DEBIT", analytic: true, alias: "compras" }
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
  { date: "2026-01-05", description: "CRED.TR.CT.INTERCRE - CONFECCOES VIEGAS LTDA", reference: "3180", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_ricardo", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-05", description: "DÉB.CONV.PREFEITURA", reference: "5643292", status: "POSTED", lines: [{ account_alias: "imposto", value: 5097, nature: "DEBIT" }, { account_alias: "sicoob", value: 5097, nature: "CREDIT" }] },
  { date: "2026-01-06", description: "DÉB.CNV.EN.ELET.GAS - CEMIG DIST", reference: "—", status: "POSTED", lines: [{ account_alias: "energia", value: 14043, nature: "DEBIT" }, { account_alias: "sicoob", value: 14043, nature: "CREDIT" }] },
  { date: "2026-01-09", description: "DEP.DINHEIRO INTERC", reference: "4092", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_congonhas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-09", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "ingles", value: 20000, nature: "DEBIT" }, { account_alias: "sicoob", value: 20000, nature: "CREDIT" }] },
  { date: "2026-01-12", description: "DÉB.TIT.COMPE.EFETI", reference: "5655118", status: "POSTED", lines: [{ account_alias: "internet", value: 9990, nature: "DEBIT" }, { account_alias: "sicoob", value: 9990, nature: "CREDIT" }] },
  { date: "2026-01-12", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "denilson_pessoal", value: 9115, nature: "DEBIT" }, { account_alias: "sicoob", value: 9115, nature: "CREDIT" }] },
  { date: "2026-01-12", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "unimed", value: 103110, nature: "DEBIT" }, { account_alias: "sicoob", value: 103110, nature: "CREDIT" }] },
  { date: "2026-01-13", description: "DEP.DINHEIRO INTERC", reference: "4117", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_nova_serrana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-13", description: "DEP.DINHEIRO INTERC", reference: "4092", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete2", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-13", description: "DEP.DINHEIRO INTERC", reference: "4092", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-14", description: "DEP.DINHEIRO INTERC", reference: "4092", status: "POSTED", lines: [{ account_alias: "sicoob", value: 65000, nature: "DEBIT" }, { account_alias: "salario_ouro_branco", value: 65000, nature: "CREDIT" }] },
  { date: "2026-01-14", description: "DEP.DINHEIRO INTERC", reference: "4101", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_mariana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-14", description: "DB.TR.C.DIF.TIT.INT", reference: "5688491", status: "POSTED", lines: [{ account_alias: "pool", value: 167200, nature: "DEBIT" }, { account_alias: "sicoob", value: 167200, nature: "CREDIT" }] },
  { date: "2026-01-15", description: "DÉB.CONV.SANEAMENTO", reference: "—", status: "POSTED", lines: [{ account_alias: "agua", value: 52870, nature: "DEBIT" }, { account_alias: "sicoob", value: 52870, nature: "CREDIT" }] },
  { date: "2026-01-15", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "denilson_pessoal", value: 2150, nature: "DEBIT" }, { account_alias: "sicoob", value: 2150, nature: "CREDIT" }] },
  { date: "2026-01-15", description: "DEP.DINHEIRO INTERC", reference: "4092", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_parademinas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-16", description: "DÉB.SAQUE INTERCRED", reference: "4034", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 200000, nature: "DEBIT" }, { account_alias: "sicoob", value: 200000, nature: "CREDIT" }] },
  { date: "2026-01-19", description: "DEP.DINHEIRO INTERC", reference: "4034", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_betim", value: 90000, nature: "CREDIT" }] },
  { date: "2026-01-22", description: "DÉB.CONV.DEM.EMPRES", reference: "—", status: "POSTED", lines: [{ account_alias: "cartao_sicoob", value: 61030, nature: "DEBIT" }, { account_alias: "sicoob", value: 61030, nature: "CREDIT" }] },
  { date: "2026-01-23", description: "DÉB.SAQUE INTERCRED", reference: "3113", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 200000, nature: "DEBIT" }, { account_alias: "sicoob", value: 200000, nature: "CREDIT" }] },
  { date: "2026-01-23", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "carro", value: 18600, nature: "DEBIT" }, { account_alias: "sicoob", value: 18600, nature: "CREDIT" }] },
  { date: "2026-01-26", description: "CRED.TR.CT.INTERCRE", reference: "4034", status: "POSTED", lines: [{ account_alias: "sicoob", value: 1000000, nature: "DEBIT" }, { account_alias: "apartamento_geraldo", value: 1000000, nature: "CREDIT" }] },
  { date: "2026-01-28", description: "DÉB.CONV.PREFEITURA", reference: "5738897", status: "POSTED", lines: [{ account_alias: "imposto", value: 5091, nature: "DEBIT" }, { account_alias: "sicoob", value: 5091, nature: "CREDIT" }] },
  { date: "2026-02-02", description: "DEB.EMI.TED MSM.TIT", reference: "5755446", status: "POSTED", lines: [{ account_alias: "apartamento_geraldo", value: 504050, nature: "DEBIT" }, { account_alias: "sicoob", value: 504050, nature: "CREDIT" }] },
  { date: "2026-02-02", description: "PIX.EMIT.OUT IF-MSM", reference: "Pix", status: "POSTED", lines: [{ account_alias: "apartamento_geraldo", value: 189700, nature: "DEBIT" }, { account_alias: "sicoob", value: 189700, nature: "CREDIT" }] },
  { date: "2026-02-06", description: "DÉB.CNV.EN.ELET.GAS", reference: "—", status: "POSTED", lines: [{ account_alias: "energia", value: 14055, nature: "DEBIT" }, { account_alias: "sicoob", value: 14055, nature: "CREDIT" }] },
  { date: "2026-02-18", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "denilson_pessoal", value: 2150, nature: "DEBIT" }, { account_alias: "sicoob", value: 2150, nature: "CREDIT" }] },
  { date: "2026-02-18", description: "DÉB.CONV.SANEAMENTO", reference: "—", status: "POSTED", lines: [{ account_alias: "agua", value: 66235, nature: "DEBIT" }, { account_alias: "sicoob", value: 66235, nature: "CREDIT" }] },
  { date: "2026-02-20", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "unimed", value: 113133, nature: "DEBIT" }, { account_alias: "sicoob", value: 113133, nature: "CREDIT" }] },
  { date: "2026-02-23", description: "DÉB.TIT.COMPE.EFETI", reference: "5844649", status: "POSTED", lines: [{ account_alias: "cartao_nubank", value: 49987, nature: "DEBIT" }, { account_alias: "sicoob", value: 49987, nature: "CREDIT" }] },
  { date: "2026-02-23", description: "DÉB.CONV.DEM.EMPRES", reference: "5844649", status: "POSTED", lines: [{ account_alias: "cartao_sicoob", value: 61030, nature: "DEBIT" }, { account_alias: "sicoob", value: 61030, nature: "CREDIT" }] },
  { date: "2026-03-04", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "imposto", value: 8040, nature: "DEBIT" }, { account_alias: "sicoob", value: 8040, nature: "CREDIT" }] },
  { date: "2026-03-04", description: "DB.TR.C.DIF.TIT.INT", reference: "Pix", status: "POSTED", lines: [{ account_alias: "imposto", value: 5000, nature: "DEBIT" }, { account_alias: "sicoob", value: 5000, nature: "CREDIT" }] },
  { date: "2026-03-04", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "internet", value: 13896, nature: "DEBIT" }, { account_alias: "sicoob", value: 13896, nature: "CREDIT" }] },
  { date: "2026-03-06", description: "DÉB.CNV.EN.ELET.GAS", reference: "—", status: "POSTED", lines: [{ account_alias: "energia", value: 14126, nature: "DEBIT" }, { account_alias: "sicoob", value: 14126, nature: "CREDIT" }] },
  { date: "2026-03-10", description: "DÉB.TIT.COMPE.EFETI", reference: "5887062", status: "POSTED", lines: [{ account_alias: "internet", value: 9990, nature: "DEBIT" }, { account_alias: "sicoob", value: 9990, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "CRÉD.TED-STR - PROSISCO PROJETOS DE SISTEMAS LTDA", reference: "359128458", status: "POSTED", lines: [{ account_alias: "sicoob", value: 198750, nature: "DEBIT" }, { account_alias: "prosisco", value: 198750, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "fillipe_palhares", value: 1333, nature: "DEBIT" }, { account_alias: "sicoob", value: 1333, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "PIX RECEB.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "sicoob", value: 65000, nature: "DEBIT" }, { account_alias: "salario_ouro_branco", value: 65000, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "denilson_pessoal", value: 2150, nature: "DEBIT" }, { account_alias: "sicoob", value: 2150, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "DÉB.CONV.SANEAMENTO", reference: "—", status: "POSTED", lines: [{ account_alias: "agua", value: 68225, nature: "DEBIT" }, { account_alias: "sicoob", value: 68225, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "DB.TR.C.DIF.TIT.INT", reference: "Pix", status: "POSTED", lines: [{ account_alias: "pool", value: 114800, nature: "DEBIT" }, { account_alias: "sicoob", value: 114800, nature: "CREDIT" }] },
  { date: "2026-03-17", description: "DB CONV MULTAS TRAN", reference: "5940749", status: "POSTED", lines: [{ account_alias: "carro", value: 17609, nature: "DEBIT" }, { account_alias: "sicoob", value: 17609, nature: "CREDIT" }] },
  { date: "2026-03-23", description: "DÉB.CONV.DEM.EMPRES", reference: "—", status: "POSTED", lines: [{ account_alias: "cartao_sicoob", value: 56031, nature: "DEBIT" }, { account_alias: "sicoob", value: 56031, nature: "CREDIT" }] },
  { date: "2026-03-24", description: "TRANSF.RECEB-PIX SI", reference: "5970046", status: "POSTED", lines: [{ account_alias: "sicoob", value: 270000, nature: "DEBIT" }, { account_alias: "apartamento_geraldo", value: 270000, nature: "CREDIT" }] },
  { date: "2026-03-24", description: "TRANSF.RECEB-PIX SI", reference: "5970046", status: "POSTED", lines: [{ account_alias: "sicoob", value: 230000, nature: "DEBIT" }, { account_alias: "maracuja_geraldo", value: 230000, nature: "CREDIT" }] },
  { date: "2026-03-24", description: "DB.TR.C.DIF.TIT.INT", reference: "Pix", status: "POSTED", lines: [{ account_alias: "casa", value: 55203, nature: "DEBIT" }, { account_alias: "sicoob", value: 55203, nature: "CREDIT" }] },
  { date: "2026-03-24", description: "TRANSF. PIX SICOOB", reference: "Pix", status: "POSTED", lines: [{ account_alias: "casa", value: 5000, nature: "DEBIT" }, { account_alias: "sicoob", value: 5000, nature: "CREDIT" }] },
  { date: "2026-03-24", description: "DB.TR.C.DIF.TIT.INT", reference: "Pix", status: "POSTED", lines: [{ account_alias: "compras", value: 7515, nature: "DEBIT" }, { account_alias: "sicoob", value: 7515, nature: "CREDIT" }] },
  { date: "2026-03-25", description: "TRANSF.RECEB-PIX SI", reference: "5975839", status: "POSTED", lines: [{ account_alias: "sicoob", value: 500000, nature: "DEBIT" }, { account_alias: "maracuja_geraldo", value: 500000, nature: "CREDIT" }] },
  { date: "2026-03-25", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "compras", value: 10500, nature: "DEBIT" }, { account_alias: "sicoob", value: 10500, nature: "CREDIT" }] },
  { date: "2026-03-25", description: "DB.TR.C.DIF.TIT.INT", reference: "Pix", status: "POSTED", lines: [{ account_alias: "compras", value: 1894, nature: "DEBIT" }, { account_alias: "sicoob", value: 1894, nature: "CREDIT" }] },
  { date: "2026-03-25", description: "SAQ S/ CARTÃO", reference: "0003ATM", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 200000, nature: "DEBIT" }, { account_alias: "sicoob", value: 200000, nature: "CREDIT" }] },
  { date: "2026-03-25", description: "TRANSF. PIX SICOOB", reference: "Pix", status: "POSTED", lines: [{ account_alias: "compras", value: 14532, nature: "DEBIT" }, { account_alias: "sicoob", value: 14532, nature: "CREDIT" }] },
  { date: "2026-03-27", description: "PIX.EMIT.OUT IF-MSM", reference: "Pix", status: "POSTED", lines: [{ account_alias: "denilson_pessoal", value: 48057, nature: "DEBIT" }, { account_alias: "sicoob", value: 48057, nature: "CREDIT" }] },
  { date: "2026-03-30", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "nubank", value: 50000, nature: "DEBIT" }, { account_alias: "sicoob", value: 50000, nature: "CREDIT" }] }
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
