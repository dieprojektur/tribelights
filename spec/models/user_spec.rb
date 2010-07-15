require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
    @user.email = 'test@example.com'
    @user.password = 'testing123'
    @user.password_confirmation = 'testing123'
  end
  
  it "should create an empty profile and add it" do
    profile = Factory.build(:empty_profile)
    Profile.should_receive(:create).with(no_args()).and_return(profile)
    @user.save.should be_true
    @user.profile.should == profile
  end
end
