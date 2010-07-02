require 'spec_helper'

describe "profiles/index.html.erb" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile),
      stub_model(Profile)
    ])
  end

  it "renders a list of profiles" do
    render
  end
end
