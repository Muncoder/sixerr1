class ProductsController < ApplicationController

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Saved successfully"
      redirect_to products_path
    else
      flash[:notice] = "Error ! could not saved"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end