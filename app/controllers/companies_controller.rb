class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      session[:user_id] = user.id
      redirect_to @company
    else
      render :'home/index'
    end
  end

  def show
    @company = Company.find_by(params[:id])
  end

  private

    def company_params
      params.require(:company).permit(:location, :address, :city, :state)
    end

end
