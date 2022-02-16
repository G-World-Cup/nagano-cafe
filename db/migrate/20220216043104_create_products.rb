class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :genre_id
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
