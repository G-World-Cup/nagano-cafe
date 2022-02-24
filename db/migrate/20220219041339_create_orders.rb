class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage, default: 800
      t.integer :total_price
      t.integer :payment_method, default: 0
      t.string :customer_name
      t.string :customer_address
      t.string :customer_postcode
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
