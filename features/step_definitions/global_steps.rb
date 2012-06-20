def wait_for_ajax_call_to_finish
  keep_looping = true
  while keep_looping do
    # TODO: Test this. It might be more efficient by sleeping for < 1 second.
    sleep 1
    begin
      count = page.evaluate_script('window.running_ajax_calls').to_i
      keep_looping = false if count == 0
    rescue => e
      if e.message.include? 'HTMLunitCorejsJavascript::Undefined'
        raise "For 'I wait for the AJAX call to finish' to work, please include culerity.js after including jQuery."
      else
        raise e
      end
    end
  end
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end

Then /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I wait for the AJAX call to finish$/ do
  wait_for_ajax_call_to_finish
end
