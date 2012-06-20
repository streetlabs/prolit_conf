FactoryGirl.define do
  sequence :user_email do |counter|
    "user#{counter}@example.com"
  end

  factory :user do
    attendee  { FactoryGirl.create(:attendee) }
    email     { generate(:user_email) }
    password  "password"
    password_confirmation  "password"
  end
end
