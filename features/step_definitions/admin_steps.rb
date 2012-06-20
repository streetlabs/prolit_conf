Given /^an admin "(.*?)"$/ do |name|
  admin = FactoryGirl.create(:admin, :name => name)
  admin.should_not be_nil
  admin.user.confirm!.should be_true
  admin.user.approve!.should be_true
end

Then /^I should see "(.*?)" account status as "(.*?)"$/ do |name, state|
  click_link "Attendees"

  attendee = Attendee.find_by_name(name)
  attendee.should_not be_nil
  status = state == "activated" ? "true" : "false"

  # workaround, find some good solution
  # page.all("#attendee_#{attendee.id} approved?").should have_content(status)
  page.all("#attendee_#{attendee.id} td")[4].should have_content(status)
end

Then /^I activate "(.*?)" account$/ do |name|
  attendee = Attendee.find_by_name(name)
  attendee.should_not be_nil

  page.within("#attendee_#{attendee.id}") do
    click_link("Edit")
  end

  click_link "Activate"
end

Then /^I update "(.*?)" role to "(.*?)"$/ do |name, role|
  attendee = Attendee.find_by_name(name)
  attendee.should_not be_nil

  page.within("#attendee_#{attendee.id}") do
    click_link("Edit")
  end

  role_value = Attendee::ROLES.find { |k, v| k == role.to_sym }.last
  check("attendee_role_#{role_value}")
  click_button("Update Attendee")
end

Then /^I should see "(.*?)" roles set to "(.*?)"$/ do |name, roles|
  click_link "Attendees"

  attendee = Attendee.find_by_name(name)
  attendee.should_not be_nil

  # workaround, find some good solution
  page.all("#attendee_#{attendee.id} td")[5].should have_content(roles)
end
