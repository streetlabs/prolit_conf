ActiveAdmin.register Attendee do
  index do
    column :id
    column :name
    column :email
    column :confirmed?
    column :approved?
    column :roles do |attendee|
      attendee.get_roles.collect { |r| r.to_s.capitalize }.join(", ")
    end
    default_actions
  end
end
