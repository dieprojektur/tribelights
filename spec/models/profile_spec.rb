require 'spec_helper'

describe Profile do
  it "should not be valid when no reference to user exists" do
    profile = Profile.new
    profile.user = nil
    profile.should_not be_valid
  end
  it "should have versions" do
    user = Factory.build(:user)
    profile = Profile.new
    profile.name = Name.new
    profile.name.first = 'Jack'
    profile.name.last = 'Johnson'
    profile.birthday = '2010-07-01'
    profile.user = user
    profile.save
    profile.version.should == 1
    profile.revise
    profile.birthday = '2010-07-05'
    profile.save
    profile.version.should == 2
    profile.versions.last.birthday.should == Date.parse('2010-07-01')
  end
   it "should create an empty name on initializing" do
     user = Factory.build(:valid_user, :profile => Profile.new)
     user.save
     user.profile.name.should_not be_nil
     user.profile.name.full.should be_nil 
   end
   it "should create a public profile on saving" do
     user = Factory.build(:valid_user, :profile => Profile.new)
     user.profile.create_name(:first => "Check", :last => "Bauer" )
     user.save
     user.profile.public_profile.should_not be_nil
     user.profile.public_profile.name.should == "Check Bauer"
   end
   it "should be able to add public profiles as friends" do
     user = Factory.build(:valid_user, :profile => Profile.new)
     user.save
     other = PublicProfile.create
     user.profile.friends << other
   end
   it "should be able to add public profiles as pending friends" do
     user = Factory.build(:valid_user, :profile => Profile.new)
     user.save
     other = PublicProfile.create
     user.profile.pending_friends << other
   end
end
