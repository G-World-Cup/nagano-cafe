class Public::HomesController < ApplicationController
  def top
    @products = Product.order(created_at: :desc).limit(4)
  end

  def about
  end
end
