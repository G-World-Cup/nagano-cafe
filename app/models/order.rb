class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  #enum追加
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_pay: 0, check_pay: 1, in_production: 2, preparing_ship: 3, shipped: 4 }

  def total_count
    self.order_details.all.sum(:count)
  end
  

end
