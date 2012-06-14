require "spec_helper"

describe ActivationMailer do
  describe "It should send modified confirmation mails on registertion" do
    before (:each) do
      ActivationMailer.deliveries.clear
      @user = FactoryGirl.create(:user)
    end

    after (:each) do
      ActivationMailer.deliveries.clear
    end

    it "should modify confirmation emails properly" do
      ActivationMailer.deliveries.should_not be_empty
      mail = ActivationMailer.deliveries.first
      mail.subject.should == 'Proletarian Registration'
    end
  end
end
