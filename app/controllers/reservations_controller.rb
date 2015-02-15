class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy, :edit, :update]
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

	def edit
		@reservation = Reservation.find(params[:id])
	end 

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		@reservation.user = current_user

		if @reservation.save
			# redirect_to restaurant_reservation_url(@restaurant, @reservation), notice: 'Reservation made!'
			redirect_to reservations_url, notice: 'Reservation made!'
		
		else 
			render 'restaurants/show'
		end
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
