class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy, :edit, :update]
	before_filter :load_restaurant, :except => [:index]

	def index
		@reservations = Reservation.all
	end 

	def show
		# @reservation = Reservation.find(params[:id])
		@reservation.newest_first = Reservation.find(params[:id])
	end 

	def new
		@reservation = Reservation.new
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end 

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		@reservation.user = current_user

# Ro's additions
	# 	all_reservations = Reservation.where(restaurant_id: @restaurant.id)
	# 	same_date = all_reservations.where(date: params[:date])
	# 	same_time = same_date.where(time: params[:time])
	# 	puts "all_reservation is #{all_reservations}"
	# # Loop
	# 	crowd = 0
	# 	same_time.each do |crowd|
	# 		crowd += same_date.party_size
	# 		if crowd <= @restaurant.capacity
	# 			@reservation.save
	# 		else 
	# 			flash.now[:alert] = "The restaurant is full at this time, Try some other time"
	# 			render :new
	# 		end
		if @restaurant.available?(@reservation.restaurant_id, @reservation.party_size, @reservation.date, @reservation.time) && @reservation.save
			redirect_to reservations_url, notice: 'Reservation made!'
		else 
			flash.now[:alert] = "Unfortunately, no reservations are available for this time."
			render :new
			# flash.now[:alert] = "Overload!"
			# render 'restaurants/show'
		end

			# if @reservation.save
			# # redirect_to restaurant_reservation_url(@restaurant, @reservation), notice: 'Reservation made!'
			# redirect_to reservations_url, notice: 'Reservation made!'
		
			# else 
			# 	render 'restaurants/show'
			# end

		
# end Ro
		
	end 


	def update
		@reservation = Reservation.find(params[:id])
		if @reservation.update_attributes(reservation_params)
			# redirect_to reservations_path(@reservation)
			redirect_to reservations_url

		else
			render :edit
		end 
	end 

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to reservations_url
	end 

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :restaurant_id, :date, :time, :party_size)
	end 

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end 
end
