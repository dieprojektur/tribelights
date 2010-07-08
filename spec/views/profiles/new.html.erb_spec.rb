require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, Factory.build(:profile))
  end

  it "renders new profile form" do
    render

    rendered.should have_selector("form", :action => profiles_path, :method => "post") do |form|
    end
  end
end
