FactoryGirl.define do
  sequence :attendee_name do |counter|
    "Harry#{counter}"
  end

  factory :attendee do
    name   { generate(:attendee_name) }
    roles  Attendee::ROLES[:attendee]

    factory :unconfirmed do
      roles  Attendee::ROLES[:unconfirmed]
    end

    factory :presenter do
      roles  Attendee::ROLES[:presenter]
    end

    factory :keynote do
      roles  Attendee::ROLES[:keynote]
    end

    factory :chair do
      roles  Attendee::ROLES[:chair]
    end

    factory :admin do
      roles  Attendee::ROLES[:admin]
    end

    after(:create) do |attendee|
      attendee.user ||= FactoryGirl.create(:user, :attendee => attendee, :email => attendee.name + "@example.com")
    end
  end
end
