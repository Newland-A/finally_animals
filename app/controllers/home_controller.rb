class HomeController < ApplicationController

  def index
    # binding.pry
  end

  def search
    if params[:search].blank?
      redirect_to root_path, alert: "Empty Field"
    else
      @parameter = params[:search].downcase  
    @results = Company.all.where("location LIKE :search", search: @parameter) 
    end
  end
  private

  def company_params
     params.require(:company).permit(:location, :address, :city, :state, :search) 
  end
end