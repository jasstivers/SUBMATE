puts "Clearing existing data..."
Booking.destroy_all
Submarine.destroy_all
User.destroy_all

puts "Seeding users..."
users = [
  { name: "Stamati", email: "stamati@example.com", password: "password123" },
  { name: "Jasmin", email: "jasmin@example.com", password: "password123" },
  { name: "Jakub", email: "jakub@example.com", password: "password123" },
  { name: "Max", email: "max@example.com", password: "password123" }
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
    user_id: User.first.id # Assign user_id from the first user
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
    user_id: User.second.id # Assign user_id from the second user
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
    user_id: User.third.id # Assign user_id from the third user
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
    user_id: User.last.id # Assign user_id from the last user
  }
]

submarines.each do |submarine_data|
  Submarine.create!(submarine_data)
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
