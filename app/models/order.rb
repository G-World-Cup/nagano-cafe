class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  #enum追加
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_pay: 0, check_pay: 1, in_production: 2, preparing_ship: 3, shipped: 4 }

  def add_tax_price
    (price*1.1).floor
  end
  
  def subtotal_price
    product.add_tax_price * count
  end
  
  def total_price
    total_price = 0
    self.order_details.each do |order_detail|
      total_price += order_detail.subtotal_price
    end
    total_price += 800
    return total_price
  end
  
end
