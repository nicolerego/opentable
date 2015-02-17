class Category < ActiveRecord::Base

	belongs_to :restaurant

	def self.search(search)
  		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['cuisine LIKE ?', search_condition])
	end

end
