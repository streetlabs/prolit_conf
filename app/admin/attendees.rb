ActiveAdmin.register Attendee do

  index do
    column :id
    column :name
    column :email, :sortable => false
    column :confirmed?, :sortable => false
    column :approved?, :sortable => false
    column :roles do |attendee|
      attendee.get_roles.collect { |r| r.to_s.capitalize }.join(", ")
    end
    default_actions
  end

  form :partial => "form"

  controller do
    def update
      role_ids = params[:attendee].delete(:role_ids).collect { |r| r.to_i }
      super do
        roles = Attendee::ROLES.collect do |key, value|
          role_ids.include?(value) ? key : nil
        end.compact

        @attendee.set_roles!(roles)
      end
    end
  end
end
