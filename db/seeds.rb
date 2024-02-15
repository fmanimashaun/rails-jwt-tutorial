# create the admin user
User.find_or_create_by!(username: 'admin') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.email = 'admin@example.com'
  user.name = 'Admin User'
  user.role = :admin
end
