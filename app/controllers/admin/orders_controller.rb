class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order_details = @order.order_details
  end

  def update
    @order.update(order_params)
    redirect_to request.referer
    @order_details = @order.order_details
  end

 private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.reguire(:order).permit(:order_status)
    end
end
