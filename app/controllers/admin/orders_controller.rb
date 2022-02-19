class Admin::OrdersController < ApplicationController
  before_action :set_product, only: [:show, :update]
  
  def index
    @orders = Order.all
  end

  def show
    @order_details = @order.order_details
  end
  
  def update
    @order.update(order_params)
    redirect_to 
  end

 private

    def set_product
      @order = Order.find(params[:id])
    end

    def order_params
      params.reguire(:order).permit(:status)
    end
end
