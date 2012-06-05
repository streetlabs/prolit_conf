# == Schema Information
# Schema version: 20081014053040
#
# Table name: talks
#
#  id          :integer         not null, primary key
#  paper_id    :integer
#  attendee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Talk < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :paper
end
