# create the admin user
User.find_or_create_by!(username: "admin") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.email = "admin@example.com"
  user.name = "Admin User"
  user.role = :admin
end

# Create cities
cities = [
  "New York",
  "Los Angeles",
  "Chicago",
  "Houston",
  "Phoenix",
  "Philadelphia",
  "San Antonio",
  "San Diego",
  "Dallas",
  "San Jose",
  "Austin",
  "Jacksonville",
  "Fort Worth",
  "Columbus",
  "Charlotte",
  "San Francisco",
  "Indianapolis",
  "Seattle",
  "Denver",
  "Washington"
]

cities.each { |city_name| City.find_or_create_by!(name: city_name) }
