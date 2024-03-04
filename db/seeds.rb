# create the admin user
User.find_or_create_by!(
  username: Rails.application.credentials.admin[:username]
) do |user|
  user.password = Rails.application.credentials.admin[:password]
  user.password_confirmation = Rails.application.credentials.admin[:password]
  user.email = Rails.application.credentials.admin[:email]
  user.name = "Admin User"
  user.role = :admin
end
