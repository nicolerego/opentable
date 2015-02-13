class Restaurant < ActiveRecord::Base
	validates :name, :location, :phone_number, :open_hours, :description, :menu, :price_range, :capacity, :picture, presence: true 

	has_many :reservations
	has_many :users, through: :reservations

	# belongs_to :user

	# def available?(party_size, time)
	# 	# could pass in reservation
	# 	reserved = reservations.sum(:party_size)
	# 	party_size <= (capacity - reserved)
	# end

	def available?(party_size, party_time)
		total_reservation_count = reservations.where(party_time: party_time).sum(:party_size)
		party_size + total_reservation_count <= capacity
	end 

end
