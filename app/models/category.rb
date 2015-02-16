class Category < ActiveRecord::Base
	has_many :restaurants

	def self.search(search)
  		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['cuisine LIKE ?', search_condition, search_condition])
	end	
end
