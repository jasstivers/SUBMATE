puts "Clearing existing data..."
Booking.destroy_all
Submarine.destroy_all
User.destroy_all

puts "Seeding users..."
users = [
  { name: "Stamati" },
  { name: "Jasmin" },
  { name: "Jakub" },
  { name: "Max" }
]

users.each do |user_data|
  User.create!(user_data)
end

puts "Seeding submarines..."
submarines = [
  {
    name: "Nautilus",
    description: "A state-of-the-art luxury submarine.",
    weight_ton: 2000,
    class: "Explorer",
    prod_year: 2018,
    amenities: "Wifi, Mini-bar, Observation Deck",
    speed: 30,
    price: 5000000
  },
  {
    name: "Deep Blue",
    description: "A robust submarine built for deep-sea exploration.",
    weight_ton: 2500,
    class: "Research",
    prod_year: 2020,
    amenities: "Laboratory, Sonar, Storage",
    speed: 25,
    price: 8000000
  },
  {
    name: "Poseidon",
    description: "A high-speed submarine for rapid underwater travel.",
    weight_ton: 1500,
    class: "Scout",
    prod_year: 2019,
    amenities: "Autopilot, GPS, Reclining Seats",
    speed: 40,
    price: 3000000
  },
  {
    name: "Titan",
    description: "A cutting-edge military-grade submarine.",
    weight_ton: 3000,
    class: "Interceptor",
    prod_year: 2022,
    amenities: "Radar, Torpedoes, Stealth Mode",
    speed: 45,
    price: 10000000
  }
]

submarines.each do |submarine_data|
  Submarine.create!(submarine_data)
end

puts "Seeding bookings..."
users = User.all
submarines = Submarine.all

bookings = [
  {
    user: users[0],
    submarine: submarines[0],
    status: "confirmed",
    start_datetime: Time.now + 1.day,
    end_date: Time.now + 2.days
  },
  {
    user: users[1],
    submarine: submarines[1],
    status: "pending",
    start_datetime: Time.now + 3.days,
    end_date: Time.now + 4.days
  },
  {
    user: users[2],
    submarine: submarines[2],
    status: "cancelled",
    start_datetime: Time.now + 5.days,
    end_date: Time.now + 6.days
  },
  {
    user: users[3],
    submarine: submarines[3],
    status: "confirmed",
    start_datetime: Time.now + 7.days,
    end_date: Time.now + 8.days
  }
]

bookings.each do |booking_data|
  Booking.create!(booking_data)
end

puts "Seeding complete!"
