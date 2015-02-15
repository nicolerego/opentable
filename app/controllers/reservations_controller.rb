class ReservationsController < ApplicationController
	before_filter :load_restaurant, :except => [:index]

	def index
		@reservations = Reservation.all
	end 

	def show
		@reservation = Reservation.find(params[:id])
	end 

	def new
		@reservation = Reservation.new
	end

	# def edit
	# 	@reservation = Reservation.find(params[:id])
	# end 

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		@reservation.user = current_user

		if @reservation.save
			redirect_to restaurant_url(@restaurant), notice: 'Reservation made!'
		else 
			render 'restaurants/show'
		end
	end 

	# def update
	# end 

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		# redirect_to
	end 

	private

	def reservation_params
		params.require(:reservation).permit(:user_id, :restaurant_id, :date, :time, :party_size)
	end 

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end 
end
