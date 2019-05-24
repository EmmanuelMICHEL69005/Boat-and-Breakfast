Review.destroy_all
Booking.destroy_all
Boat.destroy_all
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
    boat = Boat.create!(
      name: Faker::Name.first_name,
      category: ["Voilier", "Bateau à moteur"].sample,
      brand: ["joliemer", "beneteau", "zodiac", "Petit Bateau"].sample,
      model: ["Cruiser", "Honey moon", "Never Lost", "The master of seas", "Below the surface", "The surfer of the seas"].sample,
      remote_photo_url: ["https://www.discoverboating.com/sites/default/files/styles/cropped_grid_item/public/all-purpose_fishingboat_0.jpg?h=ad9b7fbf&itok=PuLu5f8T",
        "https://media.tmgcreative.com/2019/TAHOE_122019/Sport-Series_182019/700_4646/Product-Beauty_1326546/700_img177098_700.jpg",
        "https://cdn.nautal.com/media/boats/463/x/463060.jpg",
        "https://samboat.cellar.services.clever-cloud.com/announcements/5b22c4934431d-m.jpg",
        "https://fifty-wp.s3.amazonaws.com/detours/uploads/2018/08/louer-un-voilier-potes-800x480.png"].sample,
      capacity: (4..10).to_a.sample,
      length: (6..20).to_a.sample,
      location: ['Toulon', 'Marseille', 'Nice', 'Carnon', 'Sete', 'Biarritz', 'Arcachon', 'Brest', 'Saint-Malo','Ajaccio', 'Saint Florent'].sample,
      price: (100..2000).to_a.sample,
      accesories: 'jet-ski',
      skipper: [true, false].sample,
      owner: user
    )
    rand(3).times do
    Review.create!(
      content: ['Thank you so much for this wonderfull night...', 'NUL', 'Decu de ce bateau', 'Skipper super sympa', 'Merci pour ces vacances'].sample,
      rating: (0..5).to_a.sample,
      boat: boat,
      )
    end
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
  remote_photo_url: ["https://www.discoverboating.com/sites/default/files/styles/cropped_grid_item/public/all-purpose_fishingboat_0.jpg?h=ad9b7fbf&itok=PuLu5f8T",
    "https://media.tmgcreative.com/2019/TAHOE_122019/Sport-Series_182019/700_4646/Product-Beauty_1326546/700_img177098_700.jpg",
    "https://cdn.nautal.com/media/boats/463/x/463060.jpg",
    "https://samboat.cellar.services.clever-cloud.com/announcements/5b22c4934431d-m.jpg",
    "https://fifty-wp.s3.amazonaws.com/detours/uploads/2018/08/louer-un-voilier-potes-800x480.png"].sample,
  picture: "https://fifty-wp.s3.amazonaws.com/detours/uploads/2018/08/louer-un-voilier-potes-800x480.png",
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
  remote_photo_url: ["https://www.discoverboating.com/sites/default/files/styles/cropped_grid_item/public/all-purpose_fishingboat_0.jpg?h=ad9b7fbf&itok=PuLu5f8T",
    "https://media.tmgcreative.com/2019/TAHOE_122019/Sport-Series_182019/700_4646/Product-Beauty_1326546/700_img177098_700.jpg",
    "https://cdn.nautal.com/media/boats/463/x/463060.jpg",
    "https://samboat.cellar.services.clever-cloud.com/announcements/5b22c4934431d-m.jpg",
    "https://fifty-wp.s3.amazonaws.com/detours/uploads/2018/08/louer-un-voilier-potes-800x480.png"].sample,
  picture: "https://fifty-wp.s3.amazonaws.com/detours/uploads/2018/08/louer-un-voilier-potes-800x480.png",
  length: 14,
  location: 'Toulon',
  price: 250,
  accesories: 'jet-ski',
  skipper: false,
  owner: user2
)

#user3 with 1 boat and 1 reservation
user3 = User.create!(
  password: 'azerty',
  email: 'user3@example.com',
  first_name: 'fuser3',
  last_name: 'luser3',
  phone_number: rand(1000000000),
  boat_licence: Faker::Vehicle.vin
)
#ending = ((Time.now + rand(4)* 60*24*60).strftime("%d/%m/%y"))

booking1 = Booking.create!(
    beginning_date: Date.today,
    ending_date: 2.day.from_now.to_date,
    total_price: 190,
    picking_place: 'Toulon',
    leaving_place: 'Monaco',
    user: user3,
    boat: boat2
)

booking2 = Booking.create!(
    beginning_date: 1.day.from_now.to_date,
    ending_date: 4.day.from_now.to_date,
    total_price: 50005,
    picking_place: 'Lyon',
    leaving_place: 'Grenoble',
    user: user3,
    boat: boat2
)

puts "Users created : #{User.all.size}/23"
