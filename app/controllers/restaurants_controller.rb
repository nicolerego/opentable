class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy, :edit, :update]
	
	def index
		@restaurants = Restaurant.all
	end 

	def show
		@restaurant = Restaurant.find(params[:id])

		if current_user 
			@reservation = @restaurant.reservations.build
		end 
	end 

	def new
		@restaurant = Restaurant.new
	end 
	
	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			# redirect_to restaurants_url
			redirect_to restaurant_path(@restaurant), notice: "Restaurant was created successfully!"
		else
			flash.now[:alert] = "Error creating restaurant"
			render :new
		end 
	end 

	def edit
		@restaurant = Restaurant.find(params[:id])
	end 

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			render :edit
		end 
	end 

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_url
	end 

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :location, :phone_number, :open_time, :close_time, :description, :menu, :price_range, :capacity, :picture)
	end

end 
