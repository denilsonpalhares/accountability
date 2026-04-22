class IncomeStatementService
  def initialize(entity, year: nil)
    @entity = entity
    @year = year || 2026
  end

  def generate
    # Root accounts
    ativo_root = find_root("ASSET")
    passivo_root = find_root("LIABILITY")
    revenue_root = find_root("REVENUE")
    expense_root = find_root("EXPENSE")

    # Data trees
    ativo_data = build_node(ativo_root)
    passivo_data = build_node(passivo_root)
    revenue_data = build_node(revenue_root)
    expense_data = build_node(expense_root)

    # Summaries
    lucro_liquido_monthly = (1..12).each_with_object({}) do |m, h|
      h[m] = (revenue_data[:balances][m] || 0) - (expense_data[:balances][m] || 0)
    end
    lucro_liquido_total = (revenue_data[:total] || 0) - (expense_data[:total] || 0)

    # Fluxo de Caixa: Movement in Ativo > Disponivel
    disponivel = ativo_root&.children&.find_by(alias: "disponivel")
    fluxo_caixa_data = build_node(disponivel)

    {
      ativo: ativo_data,
      passivo: passivo_data,
      revenue: revenue_data,
      expense: expense_data,
      summaries: {
        resultado_liquido: { balances: lucro_liquido_monthly, total: lucro_liquido_total },
        lucro_antes_ir:    { balances: lucro_liquido_monthly, total: lucro_liquido_total },
        lucro_liquido:      { balances: lucro_liquido_monthly, total: lucro_liquido_total },
        fluxo_caixa:        { balances: fluxo_caixa_data[:balances], total: fluxo_caixa_data[:total] }
      },
      year: @year
    }
  end

  private

  def find_root(type)
    @entity.accounts.find_by(account_type: type, parent_id: nil)
  end

  def build_node(account)
    return { name: "N/A", balances: (1..12).to_h { |m| [m, 0] }, total: 0, children: [] } unless account

    children_data = account.children.map { |child| build_node(child) }
    
    balances = if account.is_analytic
                 calculate_monthly_balances(account)
               else
                 aggregate_monthly_balances(children_data)
               end

    {
      id: account.id,
      code: account.code,
      name: account.name,
      alias: account.alias,
      balances: balances,
      total: balances.values.sum,
      is_analytic: account.is_analytic,
      children: children_data
    }
  end

  def calculate_monthly_balances(account)
    lines = account.entry_lines.joins(:journal_entry)
                   .where("EXTRACT(YEAR FROM journal_entries.date) = ?", @year)

    monthly = (1..12).each_with_object({}) { |m, h| h[m] = 0 }
    results = lines.group("EXTRACT(MONTH FROM journal_entries.date)", :nature).sum(:value)

    results.each do |(month, nature), value|
      month_int = month.to_i
      # For Asset/Expense (Debit nature): Debit - Credit
      # For Liability/Revenue/Equity (Credit nature): Credit - Debit
      if %w[ASSET EXPENSE].include?(account.account_type)
        monthly[month_int] += (nature == "DEBIT" ? value : -value)
      else
        monthly[month_int] += (nature == "CREDIT" ? value : -value)
      end
    end

    monthly
  end

  def aggregate_monthly_balances(children_data)
    (1..12).each_with_object({}) do |month, hash|
      hash[month] = children_data.sum { |child| child[:balances][month] || 0 }
    end
  end
end
