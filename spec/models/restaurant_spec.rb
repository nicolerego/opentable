# A restaurant must have a name
# A restaurant must have an address
# A restaurant must have a phone number
# A restaurant must have a picture
# A restaurant must have a description
# A restaurant must belong to a category
# A restaurant must not be able to accept more people than it's capacity


require 'rails_helper'

describe Restaurant do
  let(:restaurant) { Restaurant.create(:name => "Canoe", :capacity => 100) }

  # it "must have a name" do
  #   expect(user.name).to eq("Joe")
  # end

  	describe "#available?" do 
	  	it "should return true if party size is less than capacity" do
	  		expect(restaurant.available?(10, Time.new(2105, 2, 14, 18))).to eq(true)
	  	end 

	  	it "should return false if party size is greater than capacity" do 
	  		expect(restaurant.available?(102, Time.new(2105, 2, 14, 18))).to eq(false)
	  	end

	  	context "with one reservation" do 
	  		let!(:reservation) { Reservation.create(:restaurant => restaurant, :party_size => 90) }
		  	
		  	it "should return true if the restaurant isn't full" do 
		  		expect(restaurant.available?(10, Time.new(2105, 2, 14, 18))).to eq (true)

		  	end
		  	it "should return false if the restaurant is full" do 
		  		expect(restaurant.available?(110, Time.new(2105, 2, 14, 18))).to eq (false)

		  	end
  		end   
  	end 
end

