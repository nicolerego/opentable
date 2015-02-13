def random_hour(from, to)
(Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
end

puts "\nCreating users..."
100.times do
User.create!(
name: Faker::Name.name,
email: Faker::Internet.email,
password: "asdf",
user_group: ["owner", "dinner"].sample
)
print "|"
end

puts "\nCreating restaurants..."
70.times do
Restaurant.create!(
name: Faker::Company.name, 
location: Faker::Address.street_address,
phone_number: Faker::PhoneNumber.cell_phone,
open_time: ["9", "10", "12"].sample,
close_time: ["5", "10", "4"].sample,
description: Faker::Company.catch_phrase,
menu: Faker::Lorem.paragraph(2),
price_range: ["10-20", "20-40", "40-60", "60-100"].sample,
capacity: [20, 40, 60, 100].sample,
picture: Faker::Company.logo
)
print "|"
end

puts "\nCreating reservations..."
500.times do
Reservation.create!(
user_id: User.all.sample.id, 
restaurant_id: Restaurant.all.sample.id,
date: rand(10).days.from_now.to_date,
time: random_hour(10, 18),
party_size: [2,3,4,6,10,20].sample
)
print "|"
end