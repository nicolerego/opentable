class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :phone_number
      t.string :open_hours
      t.text :description
      t.text :menu
      t.string :price_range
      t.integer :capacity
      t.string :picture

      t.timestamps null: false
    end
  end
end
