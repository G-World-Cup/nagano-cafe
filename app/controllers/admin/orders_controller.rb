class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]
  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order_details = @order.order_details
  end

  def update
    @order.update(order_params)
    @order_details = @order.order_details


    if @order.order_status == "check_pay"
      @order_details.each do |order_detail|
        order_detail.making_status = "waiting_production"
        order_detail.save
      end
    end
    redirect_to request.referer
  end

  def search
    @customer = Customer.find(params[:customer_id])

 private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_status)
    end
end
