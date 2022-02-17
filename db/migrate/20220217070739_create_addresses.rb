class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :customer_id
      t.string :postal_code
      t.string :shipping_address
      
      t.timestamps
    end
  end
end
