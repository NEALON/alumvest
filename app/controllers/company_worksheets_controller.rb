class CompanyWorksheetsController < ApplicationController
  def show
    @cw = CompanyWorksheet.find(params[:id])
    if cbf = @cw.company_basic_form
      redirect_to company_basic_form_path(cbf)
    else
      redirect_to new_company_basic_form_path
    end
  end
end
