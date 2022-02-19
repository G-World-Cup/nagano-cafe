class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :count
      t.integer :price
      t.integer :making_status, default: 0

      t.timestamps
    end
  end
end
