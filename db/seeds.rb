puts "Clearing existing data..."
Booking.destroy_all
Submarine.destroy_all
User.destroy_all

puts "Seeding users..."
users = [
  { name: "Stamati", email: "stamati@example.com", password: "password123" },
  { name: "Jasmin", email: "jasmin@example.com", password: "password123" },
  { name: "Jakub", email: "jakub@example.com", password: "password123" },
  { name: "Max", email: "max@example.com", password: "password123" },
  { name: "Elon Musk", email: "elon@example.com", password: "password123" }
]

users.each do |user_data|
  user = User.create!(user_data)
  puts "Created user: #{user.name}"  # Confirm user creation
end

puts "Seeding submarines..."
submarines = [
  {
    name: "Nautilus",
    description: "A state-of-the-art luxury submarine.",
    weight_ton: 2000,
    submarine_class: "Explorer",
    prod_year: 2018,
    amenities: "Wifi, Mini-bar, Observation Deck",
    speed: 30,
    price: 5000000,
    image_tag: "nautilus",
    user_id: User.last.id # Assign user_id from the first user
  },
  {
    name: "Deep Blue",
    description: "A robust submarine built for deep-sea exploration.",
    weight_ton: 2500,
    submarine_class: "Research",
    prod_year: 2020,
    amenities: "Laboratory, Sonar, Storage",
    speed: 25,
    price: 8000000,
    image_tag: "deep_blue",
    user_id: User.last.id # Assign user_id from the second user
  },
  {
    name: "Poseidon",
    description: "A high-speed submarine for rapid underwater travel.",
    weight_ton: 1500,
    submarine_class: "Scout",
    prod_year: 2019,
    amenities: "Autopilot, GPS, Reclining Seats",
    speed: 40,
    price: 3000000,
    image_tag: "poseidon",
    user_id: User.last.id # Assign user_id from the third user
  },
  {
    name: "Titan",
    description: "A cutting-edge military-grade submarine.",
    weight_ton: 3000,
    submarine_class: "Interceptor",
    prod_year: 2022,
    amenities: "Radar, Torpedoes, Stealth Mode",
    speed: 45,
    price: 10000000,
    image_tag: "titan_sub",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "Sea Thunder II",
    description: "Sea Thunder is back with a vengeance! This time will be different!",
    weight_ton: 4000,
    submarine_class: "Destroyer",
    prod_year: 2025,
    amenities: "Radar, Torpedoes, Torpedoes, Torpedoes,...",
    speed: 10,
    price: 99999,
    image_tag: "sea_thunder_2",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "Seawolf",
    description: "If a wolf howls underwater, can your enemies hear it?",
    weight_ton: 2500,
    submarine_class: "Interceptor",
    prod_year: 2005,
    amenities: "Radar, Torpedoes, Stealth Mode, Duran Duran",
    speed: 60,
    price: 1500000,
    image_tag: "seawolf",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "The Dolphin",
    description: "The perfect sub for recreational porpoises!",
    weight_ton: 3000,
    submarine_class: "Interceptor",
    prod_year: 2022,
    amenities: "Radar, Torpedoes, Stealth Mode",
    speed: 45,
    price: 10000000,
    image_tag: "fish_sub",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "Explorer IV",
    description: "Diving deep into the dark wet abyss in the name of science.",
    weight_ton: 3000,
    submarine_class: "Interceptor",
    prod_year: 2022,
    amenities: "Radar, Torpedoes, Stealth Mode",
    speed: 45,
    price: 10000000,
    image_tag: "explorer_4",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "Big Red",
    description: "A big red sub with a patriotic and modern design!",
    weight_ton: 3000,
    submarine_class: "Interceptor",
    prod_year: 2022,
    amenities: "Radar, Torpedoes, Stealth Mode",
    speed: 45,
    price: 10000000,
    image_tag: "big_red",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "The Rusty Venture",
    description: "The exact details of our sub may be disputed, but we can at least guarentee you an interesting time.",
    weight_ton: 3000,
    submarine_class: "Research",
    prod_year: 2003,
    amenities: "Radar, Periscope, Snorkel, Brock Samson",
    speed: 45,
    price: 10000000,
    image_tag: "rusty_venture",
    user_id: User.last.id # Assign user_id from the last user
  },
  {
    name: "The Valiant",
    description: "A chic, futuristic sub to the people of with a retrofuturistic vibe. Uses dial-up for extra authenticity.",
    weight_ton: 3000,
    submarine_class: "Interceptor",
    prod_year: 1985,
    amenities: "Radar, Torpedoes, Stealth Mode",
    speed: 45,
    price: 10000000,
    image_tag: "valiant",
    user_id: User.last.id # Assign user_id from the last user
  }
]

submarines.each do |submarine_data|
  submarine = Submarine.create!(submarine_data)
  photo_dir = Dir[Rails.root.join("db/Seed Images/#{submarine_data[:image_tag]}/*")]
  photo_dir.each do |item|
    photo = File.new(item)
    submarine.photos.attach(io: photo, filename: File.basename(item), content_type: "image/#{File.extname(item).delete('.')}")
  end
  submarine.save
  puts "Created submarine: #{submarine_data[:name]}"  # Confirm submarine creation
end

puts "Seeding bookings..."
users = User.all
submarines = Submarine.all

bookings = [
  {
    user: users.find_by!(name: "Stamati"),  # Ensure user exists
    submarine: submarines.find_by!(name: "Nautilus"),  # Ensure submarine exists
    status: :confirmed,  # Use symbol for status
    start_datetime: Time.now + 1.day,
    end_date: Time.now + 2.days
  },
  {
    user: users.find_by!(name: "Jasmin"),
    submarine: submarines.find_by!(name: "Deep Blue"),
    status: :pending,
    start_datetime: Time.now + 3.days,
    end_date: Time.now + 4.days
  },
  {
    user: users.find_by!(name: "Jakub"),
    submarine: submarines.find_by!(name: "Poseidon"),
    status: :cancelled,
    start_datetime: Time.now + 5.days,
    end_date: Time.now + 6.days
  },
  {
    user: users.find_by!(name: "Max"),
    submarine: submarines.find_by!(name: "Titan"),
    status: :confirmed,
    start_datetime: Time.now + 7.days,
    end_date: Time.now + 8.days
  }
]

bookings.each do |booking_data|
  puts "Creating booking for user: #{booking_data[:user].name}, submarine: #{booking_data[:submarine].name}, status: #{booking_data[:status]}"
  Booking.create!(booking_data)
end

puts "Seeding complete!"
