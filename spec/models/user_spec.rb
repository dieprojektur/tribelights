require 'spec_helper'

describe User do
  it "should be able to store a related profile" do
    user = User.new
    user.email = 'test@example.com'
    user.password = 'testing123'
    user.password_confirmation = 'testing123'
    user.save
    user.profile = Factory.build(:profile)
    user.should be_valid
  end
  
  it "should create an empty profile and add it" do
    profile = Factory.build(:empty_profile)
    Profile.should_receive(:create).with(no_args()).and_return(profile)
    user = Factory.build(:valid_user)
    user.save.should be_true
    user.profile.should == profile
  end
end
