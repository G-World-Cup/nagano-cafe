class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    redirect_to request.referer
  end

  private

    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end
end
