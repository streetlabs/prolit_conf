class UserStatusMailer < ActionMailer::Base
  default from: "from@example.com"

  def activation_request(user)
    @user = user

    # in case we fail to find any admin, then send mail to default email
    admin = Attendee.where("roles >= ?", Attendee::ROLES[:admin]).first
    email = admin && admin.email || "proletarianarts@gmail.com"
    mail :to => email, :subject => "Account Activation Required"
  end

  def account_activated(user)
    @user = user
    mail :to => @user.email, :subject => "Your Account is Activated"
  end

  def account_deactivated(user)
    @user = user
    mail :to => @user.email, :subject => "Your Account is De-Activated"
  end
end
