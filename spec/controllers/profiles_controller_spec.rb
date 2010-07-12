require 'spec_helper'

describe ProfilesController do
  include Devise::TestHelpers
  it "should show the users' profile" do
    @user = Factory.build(:valid_user)
    @user.save
    @profile = Factory.build(:empty_profile)
    @profile.user = @user
    @profile.save
    sign_in :user, @user
    get :show
    response.should be_success
  end
  it "should automatically create the profile" do
  end
  it "should edit only the users' profile"
end
