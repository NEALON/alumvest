class CompanyWorksheetsController < ApplicationController
  def show
    @cw = CompanyWorksheet.find(params[:id])
    if company = @cw.company
      redirect_to company_path(company)
    else
      redirect_to new_company_path
    end
  end
end
