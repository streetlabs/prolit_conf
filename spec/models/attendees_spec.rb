require 'spec_helper'

describe Attendee do
  describe "Creating Attendees" do
    it "should accept only valid role id combinations" do
      roles = Attendee::ROLES.values
      1.upto(roles.length) do |combination_length|
        roles.combination(combination_length).each do |role_ids|
          attendee = FactoryGirl.build(:attendee, :roles => role_ids.sum)
          attendee.save.should be_true
        end
      end
    end

    it "should invalid role id combinations" do
      [ Attendee::ROLES.values.min - 1,
        Attendee::ROLES.values.sum + 1 ].each do |role_id|
        attendee = FactoryGirl.build(:attendee, :roles => role_id)
        attendee.save.should be_false
      end
    end
  end

  describe "Attendee Interface" do
    it "should return current roles properly" do
      Attendee::ROLES.keys.each do |role|
        FactoryGirl.create(role).get_roles.should == [role]
        FactoryGirl.create(role).send("#{role}?").should be_true
      end
    end

    it "should return combination of roles properly" do
      expected = [
                  [:presenter, :keynote],
                  [:presenter, :chair],
                  [:attendee,  :chair, :admin]
                 ]

      expected.each do |roles|
        role_ids = roles.inject(0) { |sum, r| sum += Attendee::ROLES[r] }
        user = FactoryGirl.create(:attendee, :roles => role_ids)
        user.get_roles.should == roles
        roles.each { |r| user.send("#{r}?").should be_true }
      end
    end

    it "should set valid roles properly" do
      attendee = FactoryGirl.create(:attendee)
      expected = [
                  [:presenter, :keynote],
                  [:presenter, :chair],
                  [:attendee,  :chair, :admin]
                 ]

      expected.each do |roles|
        attendee.set_roles!(roles)
        attendee.get_roles.should == roles
      end
    end

    it "should not set invalid roles" do
      attendee = FactoryGirl.create(:attendee)
      expect { attendee.set_roles!([:coordinator]) }.to raise_error(Attendee::UnknownRole)
    end
  end
end
