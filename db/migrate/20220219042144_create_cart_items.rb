class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :count

      t.timestamps
    end
  end
end
