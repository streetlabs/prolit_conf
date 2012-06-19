Given /^an admin "(.*?)"$/ do |name|
  admin = FactoryGirl.create(:admin, :name => name)
  admin.should_not be_nil
  admin.user.confirm!.should be_true
  admin.user.approve!.should be_true
end
