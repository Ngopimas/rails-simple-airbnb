puts "Start the seed..."

Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3
)

5.times do
  Flat.create!(
  name: Faker::Lorem.sentence,
  address: Faker::Address.full_address,
  description: Faker::Restaurant.description,
  price_per_night: rand(5..15)*10,
  number_of_guests: rand(1..5)
)
end

puts "done"
