Given /^I access "(.*?)" page successfully$/ do |link|
  click_link(link)
  page.find('head title').text.should match(/#{link}/i)
end
