require 'spec_helper'

describe User do
  describe "Creating Users" do
    subject { FactoryGirl.create(:user) }
    it { should validate_presence_of(:attendee) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:encrypted_password) }
    it { should validate_uniqueness_of(:email) }
  end
end
