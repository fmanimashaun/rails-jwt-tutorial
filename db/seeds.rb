# create the admin user
User.find_or_create_by!(username: Rails.application.credentials.admin[:username]) do |user|
  user.password = Rails.application.credentials.admin[:password]
  user.password_confirmation = Rails.application.credentials.admin[:password]
  user.email = Rails.application.credentials.admin[:email]
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
