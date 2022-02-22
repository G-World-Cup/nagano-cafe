class Product < ApplicationRecord
  has_many :order_details
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def product_image
    image.attached? ? image : 'no_image.jpg'
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def add_tax
    (self.price * 1.10).round
  end
  
  
end
