module ApplicationHelper
	# Create and array to use to :time f.select 
	def reservation_time_select(restaurant)
		availableTimes = (restaurant.open_time...restaurant.close_time).map { |hour| formatted_time(hour) } 
	end

	# To get range to work (on 24 hour clock)
	def restaurant_time_select
		times = (0..23).map { |hour| formatted_time(hour) }
	end

	def formatted_time(hour)
		t = 1
		time = Time.new(t, t, t, hour, 00, t)
		time.strftime("%I:%M %p")
	end
 end
