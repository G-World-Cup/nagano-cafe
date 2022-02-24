class Public::ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def show
   @cart_item = CartItem.new
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def cart_item_params
   params.require(:cart_item).permit(:product_id, :count)
  end

end
