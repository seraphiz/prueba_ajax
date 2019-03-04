class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: :show

  def index
    @companies = Company.order("id DESC")
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    respond_to do |format|
      format.js
    end
  end
  
  def show
    @company = Company.find(params[:id])
    @complain = Complain.new

  end 
  
  def edit
    @company = Company.find(params[:id])
    respond_to do |format|
      format.js
    end
  end 

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    respond_to do |format|
        format.js
    end
  end 

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to do |format|
      format.js
    end
  end 

  private

  def company_params
    params.require(:company).permit(:name)
  end 
end
