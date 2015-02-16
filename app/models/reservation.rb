class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	# validates :party_size, :party_time, presence: true
	validates :party_size, :time, :date, presence: true

	validate :availability

# private
# 	def availability
# 		if !restaurant.available?(party_size, party_time)
# 			errors.add(:base, "Unfortunately, no reservations are available for this time.")
# 		end
# 	end
private
	def availability
		if !restaurant.available?(party_size, date, time)
			errors.add(:base, "Unfortunately, no reservations are available for this time.")
		end
	end
end
