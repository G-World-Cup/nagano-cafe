class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :customer_name
      t.string :customer_address
      t.string :customer_postcode

      t.timestamps
    end
  end
end
