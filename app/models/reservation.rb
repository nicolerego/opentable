class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :party_size, :time, presence: true

	# validate :availability

	scope :newest_first, -> { order(date: :ASC) }

	# private
	# def availability
	# 	if !restaurant.available?(party_size, time)
	# 		errors.add(:base, "Unfortunately, no reservations are available for this time.")
	# 	end
	# end
end
