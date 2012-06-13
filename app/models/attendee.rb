# == Schema Information
# Schema version: 20081014053040
#
# Table name: attendees
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  title       :string(255)
#  institution :string(255)
#  bio         :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Attendee < ActiveRecord::Base
  has_many :chairs, :class_name => 'Presentation', :foreign_key => 'chair_id'
  has_many :talks
  has_many :papers, :through => :talks

  # Hash of Roles
  ROLES = {
    :unconfirmed => 1,
    :attendee    => 2,
    :presenter   => 4,
    :keynote     => 8,
    :chair       => 16,
    :admin       => 32
  }

  validates :roles, :inclusion => { :in => ROLES.values.min..ROLES.values.sum }

  def get_roles
    # bitwise-and with each role value, and pick them
    ROLES.reject { |k, v| (self.roles & v) == 0 }.keys
  end

  # Adds methods like attendee? presenter? ...
  ROLES.each do |role, value|
    class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def #{role.to_s}?
        get_roles.include?(:#{role})
      end
    RUBY
  end
end
