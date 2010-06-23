require 'spec_helper'

describe "welcome/index.html.erb" do
  it "should show welcome in a h1 header" do
    render 
    rendered.should contain('Welcome#index')
  end
end
