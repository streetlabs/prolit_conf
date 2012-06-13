FactoryGirl.define do
  factory :attendee do
    roles  Attendee::ROLES[:attendee]
  end

  factory :unconfirmed, :class => Attendee do
    roles  Attendee::ROLES[:unconfirmed]
  end

  factory :presenter, :class => Attendee do
    roles  Attendee::ROLES[:presenter]
  end

  factory :keynote, :class => Attendee do
    roles  Attendee::ROLES[:keynote]
  end

  factory :chair, :class => Attendee do
    roles  Attendee::ROLES[:chair]
  end

  factory :admin, :class => Attendee do
    roles  Attendee::ROLES[:admin]
  end
end

