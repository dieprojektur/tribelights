require 'spec_helper'

describe ProfilesController do
  include Devise::TestHelpers
  before(:each) do
  end
  it "should show the users' profile" do
    @user = Factory.build(:valid_user, :profile => Profile.new)
    @user.save
    sign_in :user, @user
    get :show
    response.should be_success
  end
  it "should edit only the users' profile" do 
    @user = Factory.build(:valid_user, :profile => Profile.new)
    @user.save
    sign_in :user, @user
    get :edit
    response.should be_success
  end
end
