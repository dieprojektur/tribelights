require 'spec_helper'

describe "profiles/edit.html.erb" do
  before(:each) do
    @user = Factory.build(:valid_user)
    @user.save
    @profile = assign(:profile, @user.profile)
  end
  after(:each) do
    @user.destroy
  end

  it "renders the edit profile form" do
    render

    rendered.should have_selector("form", :action => user_profile_path(@profile), :method => "post") do |form|
      form.should have_selector("label", :for => 'profile_name_attributes_first' ) do |label|
        label.text.should == t('profiles.edit.first_name')
      end
      form.should have_selector("label" , :for => 'profile_name_attributes_last') do |label|
        label.text.should == t('profiles.edit.last_name')
      end
      form.should have_selector("label", :for => 'profile_birthday' ) do |label|
        label.text.should == t('profiles.edit.birthday')
      end
      form.should have_selector("input", :type => 'text', :name => 'profile[name_attributes][first]' )
      form.should have_selector("input", :type => 'text', :name => 'profile[name_attributes][last]' )
    end
  end
end
