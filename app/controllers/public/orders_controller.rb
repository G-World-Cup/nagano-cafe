class Public::OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item| #productsからitemsに変更
        order_detail = OrderDetail.new
        order_detail.product_id = cart_item.product_id #商品idを注文商品idに代入
        order_detail.order_id = @order.id #注文商品に注文idを紐付け
        order_detail.count = cart_item.count #商品の個数を注文商品の個数に代入
        order_detail.price = cart_item.product.add_tax #消費税込みに計算して代入
        order_detail.save
      end
    redirect_to complete_customer_orders_path
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
      @order.customer_postcode = current_customer.postcode
      @order.customer_address = current_customer.address
      @order.customer_name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所
    elsif params[:order][:address_id] == "2"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.customer_postcode = @address.postcode
      @order.customer_address = @address.address
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
