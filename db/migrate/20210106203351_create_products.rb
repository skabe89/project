class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :product_type
      t.string :description
      t.integer :price
      t.integer :rating
      t.string :favorite
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
