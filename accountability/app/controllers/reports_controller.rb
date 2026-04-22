class ReportsController < ApplicationController
  def income_statement
    @entity = Entity.find_by(name: 'Denilson')
    @year = params[:year] ? params[:year].to_i : 2026
    @months = (1..12).to_a

    @report = IncomeStatementService.new(@entity, year: @year).generate
  end
end
