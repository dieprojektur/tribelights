require "spec/spec_helper"

describe PublicProfile do
  it "should be able to be instantiated" do
    p = PublicProfile.new
  end
  it "should have a name and birthday field" do
    p = Factory.create(:public_profile)
    p.name.should_not be_nil
    p.birthday.should_not be_nil
  end
   it "should be able to be added to a profile as pending friend" do
     user = Factory.build(:valid_user, :profile => Profile.new)
     user.save
     profile = PublicProfile.create
     other = PublicProfile.create
     user.profile.pending_friends << profile
     profile.pending_friend?(user.profile).should be_true
     other.pending_friend?(user.profile).should be_false
   end

   it "should be able to be added to a profile as friend" do
     user = Factory.build(:valid_user, :profile => Profile.new)
     user.save
     profile = PublicProfile.create
     other = PublicProfile.create
     user.profile.friends << profile
     profile.friend?(user.profile).should be_true
     other.friend?(user.profile).should be_false
     profile.pending_friend?(user.profile).should be_false
     other.pending_friend?(user.profile).should be_false
   end
end
