require 'faker'

User.destroy_all

20.times do
  user = User.create!(
    password: 'azerty',
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: rand(1000000000),
    boat_licence: Faker::Vehicle.vin
  )

  rand(3).times do
    Boat.create!(
      name: Faker::Vehicle.model,
      category: ["Voilier", "Bateau à moteur"].sample,
      brand: ["joliemer", "beneteau", "zodiac"].sample,
      model: ["h4", "h3"].sample,
      capacity: (4..10).to_a.sample,
      length: (6..20).to_a.sample,
      location: ['Toulon', 'Marseille', 'Nice'].sample,
      price: (100..2000).to_a.sample,
      accesories: 'jet-ski',
      skipper: [true, false].sample,
      owner: user
    )
  end
end

#user without boat
user1 = User.create!(
  password: 'azerty',
  email: 'user1@example.com',
  first_name: 'fuser1',
  last_name: 'luser1',
  phone_number: rand(1000000000),
  boat_licence: Faker::Vehicle.vin
)

#user with 2 boats
user2 = User.create!(
  password: 'azerty',
  email: 'user2@example.com',
  first_name: 'fuser2',
  last_name: 'luser2',
  phone_number: rand(1000000000),
  boat_licence: Faker::Vehicle.vin
)

boat1 = Boat.create!(
  name: Faker::Vehicle.model,
  category: "Voilier",
  brand: "joliemer",
  model: "h4",
  capacity: 4,
  length: 12,
  location: 'Toulon',
  price: 150,
  accesories: 'jet-ski',
  skipper: true,
  owner: user2
)

boat2 = Boat.create!(
  name: Faker::Vehicle.model,
  category: "Bateau à moteur",
  brand: "joliemer",
  model: "h2",
  capacity: 6,
  length: 14,
  location: 'Toulon',
  price: 250,
  accesories: 'jet-ski',
  skipper: false,
  owner: user2
)
