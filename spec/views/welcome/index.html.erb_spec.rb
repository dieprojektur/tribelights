require 'spec_helper'

describe "welcome/index.html.erb" do
  it "should show welcome in a h1 header" do
    view.should_receive(:user_signed_in?).and_return(false)
    render 
    rendered.should contain('Welcome to KM Network')
  end
end
