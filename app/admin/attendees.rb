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

  member_action :activate do
    @attendee = Attendee.find(params[:id])
    if @attendee && @attendee.user.activate!
      redirect_to :action => :show, :notice => "Attendee Account Activated!"
    else
      redirect_to :action => :index, :notice => "Failed to Activate!"
    end
  end

  member_action :deactivate do
    @attendee = Attendee.find(params[:id])
    if @attendee && @attendee.user.deactivate!
      redirect_to :action => :show, :notice => "Attendee Account De-Activated!"
    else
      redirect_to :action => :index, :notice => "Failed to De-Activate!"
    end
  end
end
