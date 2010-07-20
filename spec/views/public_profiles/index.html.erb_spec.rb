require 'spec_helper'

describe "public_profiles/index.html.erb" do
  it "renders a profile list" do
    pp1 = mock(:profile1)
    pp1.should_receive(:name).and_return('Profile One')
    pp1.should_receive(:birthday).at_least(:once).and_return(Date.parse('2001-01-01'))
    pp2 = mock(:profile2)
    pp2.should_receive(:name).and_return('Profile Two')
    pp2.should_receive(:birthday).at_least(:once).and_return(Date.parse('2001-10-10'))
    profiles =  [pp1, pp2]
    assign(:public_profiles, profiles)
    render
    rendered.should contain("Profile One")
    rendered.should contain("Profile Two")
  end
end
