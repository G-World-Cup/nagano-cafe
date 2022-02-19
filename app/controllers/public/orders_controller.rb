class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_products.each do |cart|
        order_detail = OrderItem.new
        order_detail.product_id = cart.product_id
        order_detail.order_id = @order.id
        order_detail.count = cart.count
        order_detail.price = cart.product.add_tax
        order_detail.save
      end
    redirect_to complete_orders_path
    cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def confirm
    # カートアイテムの情報
    @cart_items = current_customer.cart_items.all
    # 送料
    @postage = 800
    # 合計額
    @total = @cart_items.inject(0) { |sum, item| sum + item.add_tax }



    # 自身の住所
    if params[:order][:address_id] == "1"
      @order = Order.new(order_params)
      @order.customer_postcode = current_customer.customer_postcode
      @order.customer_address = current_customer.customer_address
      @order.name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所
    elsif params[:order][:address_id] == "2"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.customer_postcode = @address.customer_postcode
      @order.address = @address.address
      @order.customer_name = @address.customer_name
    # 新しいお届け先
    elsif params[:order][:address_id] == "3"
      @order = Order.new(order_params)
    end
  end


  def complete
  end

  def index
    @orders = Order.all
  end

  def show
  end



  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:payment_method, :customer_postcode, :customer_address, :customer_name)
  end
end
