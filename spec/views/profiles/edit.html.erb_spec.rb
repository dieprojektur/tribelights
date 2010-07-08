require 'spec_helper'

describe "profiles/edit.html.erb" do
  before(:each) do
    user = Factory(:valid_user)
    profile = Factory.build(:profile)
    user.profile = profile
    user.save
    profile.save

    @profile = assign(:profile, profile)
  end

  it "renders the edit profile form" do
    render

    rendered.should have_selector("form", :action => user_profile_path(@profile), :method => "post") do |form|
    end
  end
end
