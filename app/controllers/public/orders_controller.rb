class Public::OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :authenticate_customer!

  def new
    @order = Order.new
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
      redirect_to complete_orders_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)

    # 商品の合計額

    # newページで選択した住所の表示
    # 自身の住所
    if params[:order][:address_id] == "1"
      @order = Order.new(order_params)
      @order.customer_postcode = current_customer.postcode
      @order.customer_address = current_customer.address
      @order.customer_name = current_customer.last_name + current_customer.first_name
    # 登録済みの住所
    elsif params[:order][:address_id] == "2" #address_idを
      @address = Address.find(params[:order][:addresses]) #address_idをaddressesに変更
      @order.customer_postcode = @address.customer_postcode #adressesモデルのカラムの名前が誤っていた
      @order.customer_address = @address.customer_address #adressesモデルのカラムの名前が誤っていた
      @order.customer_name = @address.customer_name
    # 新しいお届け先
    elsif params[:order][:address_id] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
      end
    else
      redirect_to root_path # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
    end
    # カートアイテムの情報
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :total_price, :customer_postcode, :customer_address, :customer_name, :postage, :order_status)
  end

  def address_params
    params.require(:order).permit(:customer_postcode, :customer_address, :customer_name, :customer_id)
  end
end
