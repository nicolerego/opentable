class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :party_size, :time, presence: true

	validate :availability

	scope :newest_first, -> { order(date: :ASC) }

	# Ro: need to refactor probably, cause the following check is done already in the restaurant model
	private
	def availability
		if !restaurant.available?(restaurant.id, party_size, date, time)
			errors.add(:base, "Unfortunately, no reservations are available for this time.")
		end
	end
end
