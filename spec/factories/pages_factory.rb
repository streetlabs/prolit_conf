FactoryGirl.define do
  sequence :page_identifier do |counter|
    "Page#{counter}"
  end

  factory :page do
    identifier { generate(:page_identifier) }
    title      "Home Page"
    content    "<p>Home Page</p>"
  end
end
