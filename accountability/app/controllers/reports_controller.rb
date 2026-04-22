class ReportsController < ApplicationController
  def income_statement
    @entity = Entity.find_by(name: 'Denilson')
    @year = params[:year] ? params[:year].to_i : 2026
    @months = (1..12).to_a

    @report = IncomeStatementService.new(@entity, year: @year).generate
  end

  def account_details
    @account = Account.find(params[:id])
    @lines = @account.entry_lines.joins(:journal_entry).order('journal_entries.date ASC, entry_lines.id ASC')
    
    @running_balance = 0
    @history = @lines.map do |line|
      # Adjust value based on nature
      # For Asset/Expense (Debit nature): Debit adds, Credit subtracts
      # For Liability/Revenue (Credit nature): Credit adds, Debit subtracts
      change = if %w[ASSET EXPENSE].include?(@account.account_type)
                 line.nature == "DEBIT" ? line.value : -line.value
               else
                 line.nature == "CREDIT" ? line.value : -line.value
               end
      @running_balance += change
      {
        date: line.journal_entry.date,
        description: line.journal_entry.description,
        nature: line.nature,
        value: line.value,
        balance: @running_balance
      }
    end
  end
end
