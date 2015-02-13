class User < ActiveRecord::Base
	has_secure_password

	validates :name, :email, :password, presence: true
	validates :email, uniqueness: true

	has_many :reservations
	has_many :restaurants, through: :reservations
	# has_many :owned_restaurants, :class_name => "Restaurant", :foreign_key => :user_id 
	# add foreign key to Restaurants table
end
