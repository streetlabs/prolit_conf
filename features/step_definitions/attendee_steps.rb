Given /^a confirmed attendee "(.*?)"$/ do |name|
  @attendee = FactoryGirl.create(:attendee, :name => name)
  @attendee.should_not be_nil
  @attendee.user.confirm!
end
