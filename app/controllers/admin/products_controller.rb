class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def index
    @products = Product.all
  end

  def show
  end
  
  def edit
  end
  
  def update
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :genre_id, :image_id, :introduction, :price, :is_active)
  end
end
