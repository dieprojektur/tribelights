Given /^I have the following users:$/ do |table|
  table.hashes.each do |hash|
    user = User.new(:email => hash[:email], :password => hash[:password], :password_confirmation => hash[:password])
    user.profile = Profile.new(:birthday => hash[:birthday])
    user.profile.create_name(:first => hash[:firstname], :last => hash[:lastname])
    user.save
  end
end
