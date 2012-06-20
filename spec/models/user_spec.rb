require 'spec_helper'

describe User do
  describe "Creating Users" do
    subject { FactoryGirl.create(:user) }
    it { should validate_presence_of(:attendee) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:encrypted_password) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "User Activation Interface" do
    before (:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should approve, activate and deactivate properly" do
      @user.approved?.should be_false
      @user.approve!.should  be_true
      @user.approved?.should be_true
      @user.deactivate!.should  be_true
      @user.approved?.should be_false
      @user.activate!.should be_true
      @user.approved?.should be_true
    end
  end
end
