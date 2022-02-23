class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :count, presence: true
  # 数量0以下に変更して保存されないように


  def validate_into_cart
     cart_items = self.customer.cart_items
     if (count) == nil
        return false
     elsif cart_items.any? {|cart_item| cart_item.product_id == (product_id)} == true
        return false
     else
        return true
     end
  end

  def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
    product.add_tax*count
  end
end
