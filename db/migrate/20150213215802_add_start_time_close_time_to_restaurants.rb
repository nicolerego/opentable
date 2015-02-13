class AddStartTimeCloseTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :open_time, :integer
    add_column :restaurants, :close_time, :integer
    remove_column :restaurants, :open_hours
  end
end
