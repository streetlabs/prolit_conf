class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  belongs_to :attendee
  validates :attendee_id, :email, :encrypted_password, :presence => true
  validates :email, :uniqueness => true

  # https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in
  def activate_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super() : :not_approved
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
end
