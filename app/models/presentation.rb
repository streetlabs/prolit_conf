# == Schema Information
# Schema version: 20081014053040
#
# Table name: presentations
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  chair_id    :integer
#  plenary     :boolean
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Presentation < ActiveRecord::Base
  belongs_to :chair, :class_name => 'Attendee'
  has_many :papers
end
