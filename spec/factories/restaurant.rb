FactoryGirl.define do
  factory :restaurant do
	    name "Canoe"
	    capacity { (1..200).to_a.sample }
	  
	    factory :restaurant_with_reservations do 
	    	transient do 
	    		num_reservations 3
	    	end 
	    	after(:create) do |object, transients|
	    		transients.num_reservations.times do 
	    			FactoryGirl.create(:reservation, :restaurant => object)
	    		end 
	    	end 
	    end 
  end
end