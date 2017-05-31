class CompaniesController < ApplicationController

  before_action :authenticate_user!

  def index
    @companies = Company.all

    @companies
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path, notice: 'Empresa criado com sucesso'
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])

    @company
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to companies_path, notice: 'Empresa editado com sucesso'
    else
      render 'edit'
    end
  end

  def show
    @company = Company.find(params[:id])

    @company
  end

  def destroy
    @company = Company.find(params[:id])

    if @company.destroy
      redirect_to companies_path, notice: 'Empresa deletado com sucesso'
    else
      redirect_to companies_path, alert: 'Ops, algum problema ocorreu'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
