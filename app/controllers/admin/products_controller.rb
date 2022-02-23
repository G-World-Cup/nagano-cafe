class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def new
    @product = Product.new
    @genre = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
  end

  def show
  end

  def edit
    @genre = Genre.all
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
    params.require(:product).permit(:name, :genre_id, :image, :introduction, :price, :is_active)
  end
end
