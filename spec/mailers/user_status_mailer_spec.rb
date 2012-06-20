require "spec_helper"

describe UserStatusMailer do
  describe "User Account Status Updates" do
    before (:each) do
      @admin = FactoryGirl.create(:admin, :name => "Admin")
      @attendee = FactoryGirl.create(:admin, :name => "Jane")
      UserStatusMailer.deliveries.clear
    end

    after (:each) do
      UserStatusMailer.deliveries.clear
    end

    it "should send mail to admin upon attendee confirmation" do
      UserStatusMailer.deliveries.should be_empty

      @attendee.user.confirm!
      UserStatusMailer.deliveries.should_not be_empty
      UserStatusMailer.deliveries.count.should == 1
      mail = UserStatusMailer.deliveries.first
      mail.to.first.should == @admin.email
      mail.subject.should == "Account Activation Required"
      mail.body.should match(@attendee.name)
    end

    it "should send mail to attendee upon admin activating account" do
      UserStatusMailer.deliveries.should be_empty

      @attendee.user.activate!
      UserStatusMailer.deliveries.should_not be_empty
      UserStatusMailer.deliveries.count.should == 1
      mail = UserStatusMailer.deliveries.first
      mail.to.first.should == @attendee.email
      mail.subject.should == "Your Account is Activated"
      mail.body.should match(@attendee.name)
    end

    it "should send mail to attendee upon admin de-activating account" do
      UserStatusMailer.deliveries.should be_empty

      @attendee.user.deactivate!
      UserStatusMailer.deliveries.should_not be_empty
      UserStatusMailer.deliveries.count.should == 1
      mail = UserStatusMailer.deliveries.first
      mail.to.first.should == @attendee.email
      mail.subject.should == "Your Account is De-Activated"
      mail.body.should match(@attendee.name)
    end
  end
end
