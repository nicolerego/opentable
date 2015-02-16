class CategoryController < ApplicationController

  def search
    @categories = Category.search params[:search]
  end

end
