class CategoriesController < ApplicationController

	# def new
	# 	@catergory = Category.new
	# end

	# def create

	# 	@category = Category.new(category_params)
	# 	if @category.save
	# 		# redirect_to restaurants_url
	# 		redirect_to restaurant_path(@restaurant), notice: "Catergory was created successfully!"
	# 	else
	# 		flash.now[:alert] = "Error creating category"
	# 		render :new
	# 	end 
	# end 

	def search
  		@restaurants = Restaurant.where("cuisine_id = ?", params[:category][:cuisine_id])
	#	@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:cuisine_id])

	end 

	# private
	# def category_params
	#  	params.require(:category).permit(:cuisine_id)
	# end


end
