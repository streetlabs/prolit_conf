class AddRolesToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :roles, :integer, :default => Attendee::ROLES[:unconfirmed]
  end
end
