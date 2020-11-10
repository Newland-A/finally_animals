class HomeController < ApplicationController

  def index
    @companies = Company.all
    #  @companies = Company.find(company_params)
  end

  private

  # def company_params
  #   params.require(:company).permit(:location, :address, :city, :state) 
  # end
end