class Restaurant < ActiveRecord::Base
	validates :name, :location, :phone_number, :open_time, :close_time, :description, :menu, :price_range, :capacity, :picture, presence: true 

	has_many :reservations
	has_many :users, through: :reservations

	# def available?(party_size, party_time)
		# reservations_here = Reservation.where(restaurant_id: )

		# total_reservation_count = reservations.where(time: time).sum(:party_size)
		# party_size + total_reservation_count <= capacity
	# end
	
#Ro: The method is doing all the job. We might wanna refactor by using the code in the reservation model
	def available?(id, size, date, time)
		this_restaurant = Restaurant.find(id)
		all_reservations = this_restaurant.reservations.all
		
		same_date = all_reservations.where(date: date)
		same_time = same_date.where(time: time)
		
		crowd = size
	# Loop
		same_time.each { |num|
			crowd += num.party_size.to_i }
		crowd <= this_restaurant.capacity	
	end
end
