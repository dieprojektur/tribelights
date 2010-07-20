require 'spec/spec_helper'

describe PublicProfilesController do

  it "should show a list of profiles" do
    pp1 = mock(:profile1, {:name => 'Profile One', :birthday => Date.parse('2001-01-01')})
    pp2 = mock(:profile2, {:name => 'Profile Two', :birthday => Date.parse('1993-03-06')})
    PublicProfile.should_receive(:all).and_return([pp1, pp2])
    get :index
    response.should be_success
  end
end
