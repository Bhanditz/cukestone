# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end


When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"(?: within "([^"]*)")?$/ do |button, selector|
  res = find(to_selector(button))
  res ? res.click : button_click(button)
end

When /^(?:|I )press (.*)(?: within (.*))?$/ do |button, selector|
  res = find(to_selector(button))
  res ? res.click : button_click(button)
end

When /^(?:|I )(?:follow|click) "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
      click_link(link)
  end
end

When /^(?:|I )(?:follow|click) all "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(to_selector(selector)) do
      all(to_selector(link)).each { |l| l.click }
  end
end


#When /^(?:|I )fill in "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
#  with_scope(selector) do
#    fill_in(field, :with => value)
#  end
#end
=begin
When /^(?:|I )fill in "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, value, selector|
   with_scope(selector) do
    fill_in(to_selector(field), :with => value)
  end
end
=end
#this one seems to work, where the above one does not.  Simply tweaked the regular expression

When /^(?:I\s)?fill in (.+) with "([^"]*)"(?: within ([^\"]*))?$/ do |field, value, scope|
  with_scope(scope) do
    fill_in(to_selector(field), :with => value)
  end
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"(?: within "([^"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    fill_in(field, :with => value)
  end
end

# Use this to fill in an entire form with data from a table. Example:
#
# When I fill in the following:
# | Account Number | 5002 |
# | Expiry date | 2009-11-01 |
# | Note | Nice guy |
# | Wants Email? | |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^(?:|I )fill in the following(?: within "([^"]*)")?:$/ do |selector, fields|
  with_scope(selector) do
    fields.rows_hash.each do |name, value|
      When %{I fill in "#{name}" with "#{value}"}
    end
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"(?: within "([^"]*)")?$/ do |value, field, selector|
  with_scope(selector) do
    select(value, :from => field)
  end
end

When /^(?:|I )check "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    check(field)
  end
end


When /^(?:|I )uncheck "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    uncheck(field)
  end
end

When /^(?:|I )choose "([^"]*)"(?: within "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    choose(field)
  end
end

When /^(?:|I )choose (.*)(?: within (.*))?$/ do |radioButton, selector|
  with_scope(selector) do
    choose(to_selector(radioButton))
  end
end

When /^(?:|I )attach the file "([^"]*)" to "([^"]*)"(?: within "([^"]*)")?$/ do |path, field, selector|
  with_scope(selector) do
    attach_file(field, path)
  end
end

When /^I click on the page$/ do
  page.execute_script("jQuery(document.activeElement).blur();")
end

=begin
#Generic focus step skeleton
#Needs to be changed to follow xpath/css convention
When /^(?:|I )give (.+) focus$/ do |selector|
 page.execute_script("jQuery('##{to_selector(selector)}').focus()")
end
=end

Then /^(?:|I )wait (\d+) seconds$/ do |n|
  sleep(n.to_i)
end

# HACK here!  Seems there a lot of ways "should see" can be used -- plain text
# css, xpath, json, etc.  Need to figure out way to reduce redundancy where possible.

Then /^(?:|I )should see <([^"]*)>$/ do |css|
    page.should have_css(to_selector(css))
end

When /^(.+) should be visible$/ do |field|
  find(to_selector(field)).visible?.should be_true
end

Then /^(.+) should be invisible$/ do |field|
  find(to_selector(field)).visible?.should be_false
end


Then /^(?:|I )should see JSON:$/ do |expected_json|
  require 'json'
  expected = JSON.pretty_generate(JSON.parse(expected_json))
  actual = JSON.pretty_generate(JSON.parse(response.body))
  expected.should == actual
end

Then /^(?:|I )should see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
    with_scope(to_selector(selector)) do
      if page.respond_to? :should
        page.should have_content(text)
      else
        assert page.has_content?(text)
    end
  end
end

Then /^(?:|I )should see \/([^\/]*)\/(?: within "([^"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_xpath('//*', :text => regexp)
    else
      assert page.has_xpath?('//*', :text => regexp)
    end
  end
end

Then /^(?:|I )should see "([^"]*)" within (.+)$/ do |text, selector|
  with_scope(to_selector(selector)) do
      page.should have_content(text)
  end
end

When /^(?:|I )should see a link with text "([^"]*)"(?: within (.+))?$/ do |text,selector|
  with_scope(to_selector(selector)) do
    page.should have_link(text)
  end
end

Then /^(?:|I )should not see a link with text "([^"]*)"(?: within (.+))?$/ do |text,selector|
  with_scope(to_selector(selector)) do
    page.should_not have_link(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/(?: within "([^"]*)")?$/ do |regexp, selector|
  regexp = Regexp.new(regexp)
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_xpath('//*', :text => regexp)
    else
      assert page.has_no_xpath?('//*', :text => regexp)
    end
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should contain "([^"]*)"$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" field(?: within "([^"]*)")? should not contain "([^"]*)"$/ do |field, selector, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within "([^"]*)")? should be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^the (.*) checkbox(?: within (.*))? should be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(to_selector(label))['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end


Then /^the "([^"]*)" checkbox(?: within "([^"]*)")? should not be checked$/ do |label, selector|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')}

  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Then /^(?:|I )should have the following pairs in the query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')}

  expected_params.each do |k,v|
    v.eql?(actual_params.fetch(k))
  end
end

Then /^the selected text is "([^"]*)"$/ do |text|
  if Cukestone::Conf.browser.eql?("ie")
    selected = page.evaluate_script('document.selection.createRange().text')
  else
    val = page.evaluate_script('document.activeElement.value')
    if val.eql?(nil)
      selected = page.evaluate_script('window.getSelection().toString()')
    else
      selStart = page.evaluate_script('document.activeElement.selectionStart')
      selEnd = page.evaluate_script('document.activeElement.selectionEnd')
      selected = val[selStart, selEnd]
    end
  end
  selected.should == text
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^(?:|I )follow ([^"]*)(?: within ([^"]*))?$/ do |link, selector|
  linkLocator=to_selector(link)
  if ( linkLocator =~ /#/)
    find(linkLocator).click
  else
    find_link(linkLocator).click
  end
end

Then /^(.+) should have focus$/ do |element|
  raise TestFailure.new("did not have focus", element) unless to_selector(element) == currently_focused()
end


Given /^I fill in (.+) with the "([^"]*)"$/ do |field,password|
  fill_in(to_selector(field), :with => to_selector(password))
end

When /^(?:|I )follow ([^"]*)(?: within ([^"]*))?$/ do |link, selector|  
  linkLocator=to_selector(link)
  if ( linkLocator =~ /#/)
    find(linkLocator).click
  else
    find_link(linkLocator).click
  end
end

When /^(?:|I )follow the link with text "([^"]*)"(?: within ([^"]*))?$/ do |link,selector|
  with_scope(to_selector(selector)) do
    find_link(link).click
  end
end
