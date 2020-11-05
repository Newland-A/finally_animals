class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new
  end

  def show
    @company = Company.find_by(params[:id])
  end

  private

    def company_params
      params.require(:company).permit(:location, :address, :city, :state)
    end

end
