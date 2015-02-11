class Restaurant < ActiveRecord::Base
	validates :name, :location, :phone_number, :open_hours, :description, :menu, :price_range, :capacity, :picture, presence: true 
end
