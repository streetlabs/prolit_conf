desc "Creates an admin for accessing admin dashboard"
task :create_admin => :environment do
  params = {
    "attendee_attributes"=> {
      "name" => "Administrator"
    },
    "email" => "admin@prolit.com",
    "password" => "password",
    "password_confirmation" => "password"
  }

  user = User.new(params)
  user.save!
  user.confirm!
  user.approve!

  attendee = user.attendee
  attendee.set_roles!([:admin])
end
