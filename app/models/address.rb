class Address < ApplicationRecord
  belongs_to :customer

  validates :customer_name, presence: true
  validates :customer_postcode, presence: true
  validates :customer_address, presence: true
end
