class ProductsController < ApplicationController
  def index
    @products = Product.all

    @products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Produto criado com sucesso'
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])

    @product
  end

  def edit
    @product = Product.find(params[:id])

    @product
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product, notice: 'Produto editado com sucesso'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to products_path, notice: 'Produto deletado com sucesso'
    else
      redirect_to products_path, alert: 'Ops, algum problema ocorreu'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :company_id)
  end

end
