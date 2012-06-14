
Given /^I am on signup page$/ do
  visit new_user_path
end

Given /^I sign as "(.*?)"$/ do |name|
  fill_in("user_attendee_attributes_name", :with => name)
  fill_in("user_email", :with => name + "@example.com")
  fill_in("user_password", :with => "password")
  fill_in("user_password_confirmation", :with => "password")
  click_button("Signup")
end

Given /^I try to login as "(.*?)"$/ do |name|
  visit new_user_session_path
  fill_in("user_email", :with => name + "@example.com")
  fill_in("user_password", :with => "password")
  click_button("Sign in")
end

Given /^I confirm "(.*?)" via email$/ do |name|
  email_id = (name + "@example.com").downcase

  step %Q{"#{email_id}" should receive an email}
  step %Q{"#{email_id}" opens the email}
  step %Q{I should see "Confirm my account" in the email body}
  step %Q{I follow "Confirm my account" in the email}
end

Given /^Admin approves "(.*?)"$/ do |name|
  email_id = (name + "@example.com").downcase
  user = User.find_by_email(email_id)
  user.should_not be_nil

  # purposefully skip validations here
  user.update_column(:approved, true)
end
