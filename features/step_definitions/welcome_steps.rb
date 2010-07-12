Given /^I am not authenticated$/ do
  visit("/users/sign_out")
end

Given /^I have one user with email "(.+?)" and password "(.+?)"$/ do |email,password|
  @user = Factory.create(:user, :email => email, :password => password, :password_confirmation => password)
end

Given /^I am logged in with email "(.+?)" and password "(.+?)"$/ do |email,password|
  visit new_user_session_url
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button "user_submit"
end

