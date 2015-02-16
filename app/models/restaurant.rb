class Restaurant < ActiveRecord::Base
	validates :name, :location, :phone_number, :open_hours, :description, :cuisine, :price_range, :capacity, :picture, presence: true 

	#belongs_to :cuisine
	has_many :reservations
	has_many :users, through: :reservations

	def available?(party_size, date, time)
		total_reservation_count = reservations.where(date: date).sum(:party_size)
		party_size + total_reservation_count <= capacity
	end

	# def available?(party_size, party_time)
	# 	total_reservation_count = reservations.where(party_time: party_time).sum(:party_size)
	# 	party_size + total_reservation_count <= capacity
	# end



	# def party_time(date, time)
 #    party_time = (date: date && time: time)
 #  	end
end
