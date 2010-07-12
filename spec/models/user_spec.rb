require 'spec_helper'

describe User do
  it "should be able to store a related profile" do
    profile = Factory.build(:profile)
    user = User.new
    user.email = 'test@example.com'
    user.password = 'testing123'
    user.password_confirmation = 'testing123'
    user.save
    user.profile = profile
    user.should be_valid
  end
  
  it "should create an empty profile and add it" do
    profile = Factory.build(:empty_profile)
    Profile.should_receive(:create).with(no_args()).and_return(profile)
    user = Factory.build(:valid_user)
    user.save.should_not be_nil
  end
end
