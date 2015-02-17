class Restaurant < ActiveRecord::Base
	validates :name, :location, :phone_number, :open_time, :close_time, :description, :cuisine_id, :menu, :price_range, :capacity, :picture, presence: true 

	has_many :reservations
	has_many :users, through: :reservations

	# def available?(party_size, party_time)
	# 	total_reservation_count = reservations.where(time: time).sum(:party_size)
	# 	party_size + total_reservation_count <= capacity
	# end
end
