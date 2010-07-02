require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :new_record? => true
    ))
  end

  it "renders new profile form" do
    render

    rendered.should have_selector("form", :action => profiles_path, :method => "post") do |form|
    end
  end
end
