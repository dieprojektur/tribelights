require 'spec_helper'

describe Profile do
  it "should not be valid when no reference to user exists" do
    profile = Profile.new
    profile.user = nil
    profile.should_not be_valid
  end
  it "should have versions" do
    user = Factory.build(:valid_user)
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
end
