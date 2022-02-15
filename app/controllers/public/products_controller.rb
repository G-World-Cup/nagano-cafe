class Public::ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def top
  end

  def about
  end

  def index
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
