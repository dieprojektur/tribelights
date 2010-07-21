require 'spec/spec_helper'
describe "profiles/show.html.erb" do
  it "should show the full name of the profile" do
    name = mock(Name)
    name.should_receive(:full).and_return('John Doe')
    current_user = mock(User)
    current_user.should_receive(:email).and_return('john@doe.com')
    @profile = mock(Profile)
    @profile.should_receive(:name).and_return(name)
    @profile.should_receive(:user).and_return(current_user)
    @profile.should_receive(:birthday).twice.and_return(Date.parse('2010-01-01'))
    @profile.should_receive(:picture?).and_return(false)
    assign(:profile, @profile)
    render
    rendered.should contain('John Doe')
  end
end
