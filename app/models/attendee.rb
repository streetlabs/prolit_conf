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
end
