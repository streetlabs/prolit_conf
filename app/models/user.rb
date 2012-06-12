class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  belongs_to :attendee
  validates :attendee_id, :email, :encrypted_password, :presence => true
  validates :email, :uniqueness => true
end
