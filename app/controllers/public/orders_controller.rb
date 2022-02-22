class Public::OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @total_price = calculate(current_customer)
  end

  def create
    @order = current_customer.orders.new(order_params)
    @cart_items = CartItem.all
    if @order.save
      @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.product_id = cart_item.product_id
      @order_detail.order_id = @order.id
      @order_detail.count = cart_item.count
      @order_detail.price = cart_item.product.price
      @order_detail.save
      end
      redirect_to complete_customer_orders_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    # カートアイテムの情報
    @cart_items = current_customer.cart_items.all

    # 商品の合計額
    @total_price = calculate(current_customer)

    # newページで選択した住所の表示
    # 自身の住所
    if params[:order][:address_id] == "1"
      @order = Order.new(order_params)
      @order.customer_postcode = current_customer.postcode
      @order.customer_address = current_customer.address
      @order.customer_name = current_customer.last_name + current_customer.first_name
    # 登録済みの住所
    elsif params[:order][:address_id] == "2" #address_idを
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:addresses]) #address_idをaddressesに変更
      @order.customer_postcode = @address.postal_code #adressesモデルのカラムの名前が誤っていた
      @order.customer_address = @address.shipping_address #adressesモデルのカラムの名前が誤っていた
      @order.customer_name = @address.name
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
    @total_price = calculate(current_customer)
  end

  private

  def calculate(current_customer)
   total_price = 0
   current_customer.cart_items.each do |cart_item|
     total_price += cart_item.count * cart_item.product.price
   end
   return (total_price * 1.1).floor
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:payment_method, :customer_postcode, :customer_address, :customer_name)
  end
end
