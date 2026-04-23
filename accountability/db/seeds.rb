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
  { date: "2026-01-05", description: "CRED.TR.CT.INTERCRE - CONFECCOES VIEGAS LTDA", reference: "3180", status: "POSTED", lines: [{ account_alias: "sicoob", value: 90000, nature: "DEBIT" }, { account_alias: "salario_alfenas", value: 90000, nature: "CREDIT" }] },
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
  { date: "2026-02-20", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "pool", value: 113133, nature: "DEBIT" }, { account_alias: "sicoob", value: 113133, nature: "CREDIT" }] },
  { date: "2026-02-23", description: "DÉB.TIT.COMPE.EFETI", reference: "5844649", status: "POSTED", lines: [{ account_alias: "cartao_nubank", value: 49987, nature: "DEBIT" }, { account_alias: "sicoob", value: 49987, nature: "CREDIT" }] },
  { date: "2026-02-23", description: "DÉB.CONV.DEM.EMPRES", reference: "5844649", status: "POSTED", lines: [{ account_alias: "cartao_sicoob", value: 61030, nature: "DEBIT" }, { account_alias: "sicoob", value: 61030, nature: "CREDIT" }] },
  { date: "2026-03-04", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "imposto", value: 8040, nature: "DEBIT" }, { account_alias: "sicoob", value: 8040, nature: "CREDIT" }] },
  { date: "2026-03-04", description: "DB.TR.C.DIF.TIT.INT", reference: "Pix", status: "POSTED", lines: [{ account_alias: "imposto", value: 5000, nature: "DEBIT" }, { account_alias: "sicoob", value: 5000, nature: "CREDIT" }] },
  { date: "2026-03-04", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "internet", value: 13896, nature: "DEBIT" }, { account_alias: "sicoob", value: 13896, nature: "CREDIT" }] },
  { date: "2026-03-06", description: "DÉB.CNV.EN.ELET.GAS", reference: "—", status: "POSTED", lines: [{ account_alias: "energia", value: 14126, nature: "DEBIT" }, { account_alias: "sicoob", value: 14126, nature: "CREDIT" }] },
  { date: "2026-03-10", description: "DÉB.TIT.COMPE.EFETI", reference: "5887062", status: "POSTED", lines: [{ account_alias: "internet", value: 9990, nature: "DEBIT" }, { account_alias: "sicoob", value: 9990, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "CRÉD.TED-STR - PROSISCO PROJETOS DE SISTEMAS LTDA", reference: "359128458", status: "POSTED", lines: [{ account_alias: "sicoob", value: 198750, nature: "DEBIT" }, { account_alias: "prosisco", value: 198750, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "fillipe_palhares", value: 1333, nature: "DEBIT" }, { account_alias: "sicoob", value: 1333, nature: "CREDIT" }] },
  
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
  { date: "2026-03-30", description: "PIX EMIT.OUTRA IF", reference: "Pix", status: "POSTED", lines: [{ account_alias: "nubank", value: 50000, nature: "DEBIT" }, { account_alias: "sicoob", value: 50000, nature: "CREDIT" }] },

  # NUBANK TRANSACTIONS (Section 1)
  { date: "2026-02-06", description: "Transferência recebida pelo Pix - salario_alfenas", reference: "6985e201", status: "POSTED", lines: [{ account_alias: "nubank", value: 90000, nature: "DEBIT" }, { account_alias: "salario_alfenas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-09", description: "Pagamento de fatura nubank cartao_nubank", reference: "6989ca3e", status: "POSTED", lines: [{ account_alias: "cartao_nubank", value: 29704, nature: "DEBIT" }, { account_alias: "nubank", value: 29704, nature: "CREDIT" }] },
  { date: "2026-02-09", description: "Transferência enviada pelo Pix - nubank celular", reference: "6989cdae", status: "POSTED", lines: [{ account_alias: "celular", value: 3000, nature: "DEBIT" }, { account_alias: "nubank", value: 3000, nature: "CREDIT" }] },
  { date: "2026-02-09", description: "Transferência recebida pelo Pix - salario_lavras", reference: "6989d01a", status: "POSTED", lines: [{ account_alias: "nubank", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lavras", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-09", description: "Transferência enviada pelo Pix - nubank combustivel", reference: "6989d464", status: "POSTED", lines: [{ account_alias: "combustivel", value: 5000, nature: "DEBIT" }, { account_alias: "nubank", value: 5000, nature: "CREDIT" }] },
  { date: "2026-02-09", description: "Transferência enviada pelo Pix - nubank unimed", reference: "6989dc51", status: "POSTED", lines: [{ account_alias: "unimed", value: 103110, nature: "DEBIT" }, { account_alias: "nubank", value: 103110, nature: "CREDIT" }] },
  { date: "2026-02-12", description: "Transferência enviada pelo Pix - nubank compras", reference: "698e34c0", status: "POSTED", lines: [{ account_alias: "compras", value: 2200, nature: "DEBIT" }, { account_alias: "nubank", value: 2200, nature: "CREDIT" }] },
  { date: "2026-02-14", description: "Compra no débito - nubank compras", reference: "69908406", status: "POSTED", lines: [{ account_alias: "compras", value: 9108, nature: "DEBIT" }, { account_alias: "nubank", value: 9108, nature: "CREDIT" }] },
  { date: "2026-02-14", description: "Compra no débito - nubank sff", reference: "69908815", status: "POSTED", lines: [{ account_alias: "sff", value: 9500, nature: "DEBIT" }, { account_alias: "nubank", value: 9500, nature: "CREDIT" }] },
  { date: "2026-02-19", description: "Transferência enviada pelo Pix - nubank internet", reference: "69971ebc", status: "POSTED", lines: [{ account_alias: "internet", value: 11242, nature: "DEBIT" }, { account_alias: "nubank", value: 11242, nature: "CREDIT" }] },
  { date: "2026-02-23", description: "Transferência enviada pelo Pix - nubank coinbase", reference: "699c9713", status: "POSTED", lines: [{ account_alias: "coinbase", value: 7000, nature: "DEBIT" }, { account_alias: "nubank", value: 7000, nature: "CREDIT" }] },

  # NUBANK TRANSACTIONS (Section 2)
  { date: "2026-03-02", description: "Transferência recebida pelo Pix - ouro_branco", reference: "69a5f213", status: "POSTED", lines: [{ account_alias: "nubank", value: 65000, nature: "DEBIT" }, { account_alias: "salario_ouro_branco", value: 65000, nature: "CREDIT" }] },
  { date: "2026-03-02", description: "Pagamento de fatura nubank cartao_nubank", reference: "69a63e64", status: "POSTED", lines: [{ account_alias: "cartao_nubank", value: 61883, nature: "DEBIT" }, { account_alias: "nubank", value: 61883, nature: "CREDIT" }] },
  { date: "2026-03-03", description: "Débito em conta nubank celular", reference: "69a74ef6", status: "POSTED", lines: [{ account_alias: "celular", value: 2000, nature: "DEBIT" }, { account_alias: "nubank", value: 2000, nature: "CREDIT" }] },
  { date: "2026-03-06", description: "Transferência recebida pelo Pix - salario_alfenas", reference: "69aad23a", status: "POSTED", lines: [{ account_alias: "nubank", value: 90000, nature: "DEBIT" }, { account_alias: "salario_alfenas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-09", description: "Transferência recebida pelo Pix - salario_lavras", reference: "69aecc43", status: "POSTED", lines: [{ account_alias: "nubank", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lavras", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-09", description: "Transferência enviada pelo Pix - nubank unimed", reference: "69af333a", status: "POSTED", lines: [{ account_alias: "unimed", value: 103110, nature: "DEBIT" }, { account_alias: "nubank", value: 103110, nature: "CREDIT" }] },
  { date: "2026-03-09", description: "Transferência enviada pelo Pix - nubank fillipe", reference: "69af3424", status: "POSTED", lines: [{ account_alias: "fillipe_palhares", value: 19000, nature: "DEBIT" }, { account_alias: "nubank", value: 19000, nature: "CREDIT" }] },
  { date: "2026-03-10", description: "Transferência enviada pelo Pix - nubank casa", reference: "69b0218d", status: "POSTED", lines: [{ account_alias: "casa", value: 23400, nature: "DEBIT" }, { account_alias: "nubank", value: 23400, nature: "CREDIT" }] },
  { date: "2026-03-12", description: "Transferência enviada pelo Pix - nubank fillipe", reference: "69b32eca", status: "POSTED", lines: [{ account_alias: "fillipe_palhares", value: 20000, nature: "DEBIT" }, { account_alias: "nubank", value: 20000, nature: "CREDIT" }] },
  { date: "2026-03-13", description: "Transferência recebida pelo Pix - salario_ouro_branco2", reference: "69b41025", status: "POSTED", lines: [{ account_alias: "nubank", value: 65000, nature: "DEBIT" }, { account_alias: "salario_ouro_branco2", value: 65000, nature: "CREDIT" }] },
  { date: "2026-03-16", description: "Transferência enviada pelo Pix - nubank fillipe", reference: "69b82fec", status: "POSTED", lines: [{ account_alias: "sicoob", value: 65000, nature: "DEBIT" }, { account_alias: "nubank", value: 65000, nature: "CREDIT" }] },
  { date: "2026-03-29", description: "Transferência recebida pelo Pix - fillipe nubank", reference: "69c8acbc", status: "POSTED", lines: [{ account_alias: "nubank", value: 50000, nature: "DEBIT" }, { account_alias: "fillipe_palhares", value: 50000, nature: "CREDIT" }] },

  # CASH SALARY TRANSACTIONS
  # 2026-02-15
  { date: "2026-02-15", description: "Pagamento em dinheiro CONFECCOES PIRES LAGE", reference: "cash_20260215_1", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_itauna", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro MALUCAO NOVA SERRANA", reference: "cash_20260215_2", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_nova_serrana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro CONFECCOES LUCAS PIRES LTDA", reference: "cash_20260215_3", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro LAURA COMERCIO DE ROUPAS LTDA", reference: "cash_20260215_4", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_mariana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro CARVALHO COMERCIO DE ROUPAS LTDA", reference: "cash_20260215_5", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_congonhas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro IGOR COMERCIO DE ROUPAS LTDA", reference: "cash_20260215_6", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete2", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro IAGO COMERCIO DE ROUPAS LTDA", reference: "cash_20260215_7", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_betim", value: 90000, nature: "CREDIT" }] },
  { date: "2026-02-15", description: "Pagamento em dinheiro MAGAZINE PARA DE MINAS", reference: "cash_20260215_8", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_parademinas", value: 90000, nature: "CREDIT" }] },

  # 2026-03-15
  { date: "2026-03-15", description: "Pagamento em dinheiro CONFECCOES PIRES LAGE", reference: "cash_20260315_1", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_itauna", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro MALUCAO NOVA SERRANA", reference: "cash_20260315_2", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_nova_serrana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro CONFECCOES LUCAS PIRES LTDA", reference: "cash_20260315_3", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro LAURA COMERCIO DE ROUPAS LTDA", reference: "cash_20260315_4", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_mariana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro CARVALHO COMERCIO DE ROUPAS LTDA", reference: "cash_20260315_5", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_congonhas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro IGOR COMERCIO DE ROUPAS LTDA", reference: "cash_20260315_6", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete2", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro IAGO COMERCIO DE ROUPAS LTDA", reference: "cash_20260315_7", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_betim", value: 90000, nature: "CREDIT" }] },
  { date: "2026-03-15", description: "Pagamento em dinheiro MAGAZINE PARA DE MINAS", reference: "cash_20260315_8", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_parademinas", value: 90000, nature: "CREDIT" }] },

  # 2026-04-23
  { date: "2026-04-23", description: "Pagamento em dinheiro CONFECCOES PIRES LAGE", reference: "cash_20260423_1", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_itauna", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro MALUCAO NOVA SERRANA", reference: "cash_20260423_2", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_nova_serrana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro CONFECCOES LUCAS PIRES LTDA", reference: "cash_20260423_3", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro LAURA COMERCIO DE ROUPAS LTDA", reference: "cash_20260423_4", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_mariana", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro CARVALHO COMERCIO DE ROUPAS LTDA", reference: "cash_20260423_5", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_congonhas", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro IGOR COMERCIO DE ROUPAS LTDA", reference: "cash_20260423_6", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_lafaiete2", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro IAGO COMERCIO DE ROUPAS LTDA", reference: "cash_20260423_7", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_betim", value: 90000, nature: "CREDIT" }] },
  { date: "2026-04-23", description: "Pagamento em dinheiro MAGAZINE PARA DE MINAS", reference: "cash_20260423_8", status: "POSTED", lines: [{ account_alias: "caixa_geral", value: 90000, nature: "DEBIT" }, { account_alias: "salario_parademinas", value: 90000, nature: "CREDIT" }] },

  # SICOOB CREDIT CARD TRANSACTIONS
  {:date=>"2025-07-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20250711_0", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-08-12", :description=>"CARTAO SICOOB: juros 173", :reference=>"sicoob_card_20250812_3", :status=>"POSTED", :lines=>[{:account_alias=>"juros", :value=>173, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>173, :nature=>"CREDIT"}]},
  {:date=>"2025-08-12", :description=>"CARTAO SICOOB: multa 19", :reference=>"sicoob_card_20250812_4", :status=>"POSTED", :lines=>[{:account_alias=>"juros", :value=>19, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>19, :nature=>"CREDIT"}]},
  {:date=>"2025-08-12", :description=>"CARTAO SICOOB: multa 5", :reference=>"sicoob_card_20250812_5", :status=>"POSTED", :lines=>[{:account_alias=>"juros", :value=>5, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5, :nature=>"CREDIT"}]},
  {:date=>"2025-08-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20250811_6", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-07-14", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20250714_7", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2025-07-14", :description=>"CARTAO SICOOB: Compra Britania 1/10 56.61", :reference=>"sicoob_card_20250714_8", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2025-08-14", :description=>"CARTAO SICOOB: Compra Britania 2/10 56.61", :reference=>"sicoob_card_20250814_9", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2025-09-14", :description=>"CARTAO SICOOB: Compra Britania 3/10 56.61", :reference=>"sicoob_card_20250914_10", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2025-10-14", :description=>"CARTAO SICOOB: Compra Britania 4/10 56.61", :reference=>"sicoob_card_20251014_11", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2025-11-14", :description=>"CARTAO SICOOB: Compra Britania 5/10 56.61", :reference=>"sicoob_card_20251114_12", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2025-12-14", :description=>"CARTAO SICOOB: Compra Britania 6/10 56.61", :reference=>"sicoob_card_20251214_13", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2026-01-14", :description=>"CARTAO SICOOB: Compra Britania 7/10 56.61", :reference=>"sicoob_card_20260114_14", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2026-02-14", :description=>"CARTAO SICOOB: Compra Britania 8/10 56.61", :reference=>"sicoob_card_20260214_15", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2026-03-14", :description=>"CARTAO SICOOB: Compra Britania 9/10 56.61", :reference=>"sicoob_card_20260314_16", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2026-04-14", :description=>"CARTAO SICOOB: Compra Britania 10/10 5661", :reference=>"sicoob_card_20260414_17", :status=>"POSTED", :lines=>[{:account_alias=>"eletro-eletronicos", :value=>5661, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5661, :nature=>"CREDIT"}]},
  {:date=>"2025-09-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 1/10 8389", :reference=>"sicoob_card_20250911_19", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2025-10-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 2/10 8389", :reference=>"sicoob_card_20251011_20", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2025-11-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 3/10 8389", :reference=>"sicoob_card_20251111_21", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2025-12-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 4/10 8389", :reference=>"sicoob_card_20251211_22", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2026-01-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 5/10 8389", :reference=>"sicoob_card_20260111_23", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2026-02-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 6/10 8389", :reference=>"sicoob_card_20260211_24", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2026-03-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 7/10 8389", :reference=>"sicoob_card_20260311_25", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2026-04-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 8/10 8389", :reference=>"sicoob_card_20260411_26", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2026-05-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 9/10 8389", :reference=>"sicoob_card_20260511_27", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2026-06-11", :description=>"CARTAO SICOOB: Magalu nível Mauricio 10/10 8389", :reference=>"sicoob_card_20260611_28", :status=>"POSTED", :lines=>[{:account_alias=>"casa", :value=>8389, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>8389, :nature=>"CREDIT"}]},
  {:date=>"2025-09-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20250911_29", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-09-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20250917_30", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2025-08-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 1/12 9277", :reference=>"sicoob_card_20250813_31", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2025-09-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 2/12 9277", :reference=>"sicoob_card_20250913_32", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2025-10-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 3/12 9277", :reference=>"sicoob_card_20251013_33", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2025-11-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 4/12 9277", :reference=>"sicoob_card_20251113_34", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2025-12-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 5/12 9277", :reference=>"sicoob_card_20251213_35", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-01-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 6/12 9277", :reference=>"sicoob_card_20260113_36", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-02-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 7/12 9277", :reference=>"sicoob_card_20260213_37", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-03-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 8/12 9277", :reference=>"sicoob_card_20260313_38", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-04-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 9/12 9277", :reference=>"sicoob_card_20260413_39", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-05-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 10/12 9277", :reference=>"sicoob_card_20260513_40", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-06-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 11/12 9277", :reference=>"sicoob_card_20260613_41", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2026-07-13", :description=>"CARTAO SICOOB: Curso Liga Crypto 12/12 9277", :reference=>"sicoob_card_20260713_42", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>9277, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>9277, :nature=>"CREDIT"}]},
  {:date=>"2025-08-12", :description=>"CARTAO SICOOB: anuidade 1/12 990", :reference=>"sicoob_card_20250812_43", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2025-09-12", :description=>"CARTAO SICOOB: anuidade 2/12 990", :reference=>"sicoob_card_20250912_44", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2025-10-12", :description=>"CARTAO SICOOB: anuidade 3/12 990", :reference=>"sicoob_card_20251012_45", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2025-11-12", :description=>"CARTAO SICOOB: anuidade 4/12 990", :reference=>"sicoob_card_20251112_46", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2025-12-12", :description=>"CARTAO SICOOB: anuidade 5/12 990", :reference=>"sicoob_card_20251212_47", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-01-12", :description=>"CARTAO SICOOB: anuidade 6/12 990", :reference=>"sicoob_card_20260112_48", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-02-12", :description=>"CARTAO SICOOB: anuidade 7/12 990", :reference=>"sicoob_card_20260212_49", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-03-12", :description=>"CARTAO SICOOB: anuidade 8/12 990", :reference=>"sicoob_card_20260312_50", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-04-12", :description=>"CARTAO SICOOB: anuidade 9/12 990", :reference=>"sicoob_card_20260412_51", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-05-12", :description=>"CARTAO SICOOB: anuidade 10/12 990", :reference=>"sicoob_card_20260512_52", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-06-12", :description=>"CARTAO SICOOB: anuidade 11/12 990", :reference=>"sicoob_card_20260612_53", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-07-12", :description=>"CARTAO SICOOB: anuidade 12/12 990", :reference=>"sicoob_card_20260712_54", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2025-10-11", :description=>"CARTAO SICOOB: Norton 10900", :reference=>"sicoob_card_20251011_56", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>10900, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>10900, :nature=>"CREDIT"}]},
  {:date=>"2025-10-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20251011_57", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-09-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20250917_58", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2025-11-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20251111_60", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-10-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20251017_61", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2025-10-16", :description=>"CARTAO SICOOB: Seguro 15352", :reference=>"sicoob_card_20251016_62", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15352, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15352, :nature=>"CREDIT"}]},
  {:date=>"2025-12-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20251211_65", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-12-08", :description=>"CARTAO SICOOB: ML 13437 flex botao interno power para galaxy", :reference=>"sicoob_card_20251208_66", :status=>"POSTED", :lines=>[{:account_alias=>"vinicius", :value=>13437, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>13437, :nature=>"CREDIT"}]},
  {:date=>"2025-11-29", :description=>"CARTAO SICOOB: Seguro 15351", :reference=>"sicoob_card_20251129_67", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15351, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15351, :nature=>"CREDIT"}]},
  {:date=>"2025-11-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20251117_68", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2025-11-12", :description=>"CARTAO SICOOB: ML Telefone 1/12 6575", :reference=>"sicoob_card_20251112_69", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2025-12-12", :description=>"CARTAO SICOOB: ML Telefone 2/12 6575", :reference=>"sicoob_card_20251212_70", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-01-12", :description=>"CARTAO SICOOB: ML Telefone 3/12 6575", :reference=>"sicoob_card_20260112_71", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-02-12", :description=>"CARTAO SICOOB: ML Telefone 4/12 6575", :reference=>"sicoob_card_20260212_72", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-03-12", :description=>"CARTAO SICOOB: ML Telefone 5/12 6575", :reference=>"sicoob_card_20260312_73", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-04-12", :description=>"CARTAO SICOOB: ML Telefone 6/12 6575", :reference=>"sicoob_card_20260412_74", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-05-12", :description=>"CARTAO SICOOB: ML Telefone 7/12 6575", :reference=>"sicoob_card_20260512_75", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-06-12", :description=>"CARTAO SICOOB: ML Telefone 8/12 6575", :reference=>"sicoob_card_20260612_76", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-07-12", :description=>"CARTAO SICOOB: ML Telefone 9/12 6575", :reference=>"sicoob_card_20260712_77", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2026-08-12", :description=>"CARTAO SICOOB: ML Telefone 10/12 6575", :reference=>"sicoob_card_20260812_78", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>6575, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>6575, :nature=>"CREDIT"}]},
  {:date=>"2025-11-12", :description=>"CARTAO SICOOB: desconto anuidade -990", :reference=>"sicoob_card_20250812_80", :status=>"POSTED", :lines=>[{:account_alias=>"banco", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-01-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20260111_83", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2025-12-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20251217_84", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2026-02-07", :description=>"CARTAO SICOOB: MPSMARTKIT kit eletronicos 1/6 4788", :reference=>"sicoob_card_20260207_85", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4788, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4788, :nature=>"CREDIT"}]},
  {:date=>"2026-03-07", :description=>"CARTAO SICOOB: MPSMARTKIT kit eletronicos 2/6 4788", :reference=>"sicoob_card_20260307_86", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4788, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4788, :nature=>"CREDIT"}]},
  {:date=>"2026-04-07", :description=>"CARTAO SICOOB: MPSMARTKIT kit eletronicos 3/6 4788", :reference=>"sicoob_card_20260407_87", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4788, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4788, :nature=>"CREDIT"}]},
  {:date=>"2026-05-07", :description=>"CARTAO SICOOB: MPSMARTKIT kit eletronicos 4/6 4788", :reference=>"sicoob_card_20260507_88", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4788, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4788, :nature=>"CREDIT"}]},
  {:date=>"2026-06-07", :description=>"CARTAO SICOOB: MPSMARTKIT kit eletronicos 5/6 4788", :reference=>"sicoob_card_20260607_89", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4788, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4788, :nature=>"CREDIT"}]},
  {:date=>"2026-07-07", :description=>"CARTAO SICOOB: MPSMARTKIT kit eletronicos 6/6 4788", :reference=>"sicoob_card_20260707_90", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4788, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4788, :nature=>"CREDIT"}]},
  {:date=>"2025-12-29", :description=>"CARTAO SICOOB: Seguro 15351", :reference=>"sicoob_card_20251229_91", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15351, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15351, :nature=>"CREDIT"}]},
  {:date=>"2025-12-12", :description=>"CARTAO SICOOB: desconto anuidade -990", :reference=>"sicoob_card_20250812_92", :status=>"POSTED", :lines=>[{:account_alias=>"cartao_sicoob", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"banco", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-02-11", :description=>"CARTAO SICOOB: Assinatura Liga crypto 4999", :reference=>"sicoob_card_20260211_94", :status=>"POSTED", :lines=>[{:account_alias=>"denilson_pessoal", :value=>4999, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>4999, :nature=>"CREDIT"}]},
  {:date=>"2026-01-29", :description=>"CARTAO SICOOB: Seguro 15351", :reference=>"sicoob_card_20260129_95", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15351, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15351, :nature=>"CREDIT"}]},
  {:date=>"2026-01-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20260117_96", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2026-01-12", :description=>"CARTAO SICOOB: desconto anuidade -990", :reference=>"sicoob_card_20250812_97", :status=>"POSTED", :lines=>[{:account_alias=>"cartao_sicoob", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"banco", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-01-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20260117_98", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2026-02-28", :description=>"CARTAO SICOOB: Seguro 15351", :reference=>"sicoob_card_20260228_100", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15351, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15351, :nature=>"CREDIT"}]},
  {:date=>"2026-02-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20260217_101", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2026-02-12", :description=>"CARTAO SICOOB: desconto anuidade -990", :reference=>"sicoob_card_20250812_102", :status=>"POSTED", :lines=>[{:account_alias=>"cartao_sicoob", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"banco", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-03-29", :description=>"CARTAO SICOOB: Seguro 15351", :reference=>"sicoob_card_20260329_104", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15351, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15351, :nature=>"CREDIT"}]},
  {:date=>"2026-03-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20260317_105", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2026-03-12", :description=>"CARTAO SICOOB: desconto anuidade -990", :reference=>"sicoob_card_20250812_106", :status=>"POSTED", :lines=>[{:account_alias=>"cartao_sicoob", :value=>990, :nature=>"DEBIT"}, {:account_alias=>"banco", :value=>990, :nature=>"CREDIT"}]},
  {:date=>"2026-04-17", :description=>"CARTAO SICOOB: Netflix 5590", :reference=>"sicoob_card_20260417_108", :status=>"POSTED", :lines=>[{:account_alias=>"netflix", :value=>5590, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>5590, :nature=>"CREDIT"}]},
  {:date=>"2026-04-29", :description=>"CARTAO SICOOB: Seguro 15351", :reference=>"sicoob_card_20260429_109", :status=>"POSTED", :lines=>[{:account_alias=>"carro", :value=>15351, :nature=>"DEBIT"}, {:account_alias=>"cartao_sicoob", :value=>15351, :nature=>"CREDIT"}]},

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
