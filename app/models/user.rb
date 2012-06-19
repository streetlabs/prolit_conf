class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validates :attendee, :email, :encrypted_password, :presence => true
  validates :email, :uniqueness => true
  validates :password, :confirmation => true, :unless => Proc.new { |a| a.password.blank? }

  belongs_to :attendee, :inverse_of => :user
  accepts_nested_attributes_for :attendee
  attr_accessible :attendee_attributes
  delegate :name, :admin?, :to => :attendee

  def activate!
    self.approved = true
    save!
  end
  alias approve! activate!

  def deactivate!
    self.approved = false
    save!
  end

  # https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if confirmed?
      approved? ? super() : :not_approved
    else
      :unconfirmed
    end
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
