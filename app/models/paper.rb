# == Schema Information
# Schema version: 20081014053040
#
# Table name: papers
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  description     :text
#  keynote         :boolean
#  presentation_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Paper < ActiveRecord::Base
  belongs_to :presentation
  has_many :talks
  has_many :speakers, :through => :talks, :source => :attendee
end
