class ProductsController < ApplicationController
  before_action :find_product, except: [:index, :new, :create]

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
    if @product.update(product_params)
      flash[:notice] = "Updated successfully"
      redirect_to products_path
    else
      flash[:notice] = "Error ! could not saved"
      render "edit"
    end
  end

  def destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end