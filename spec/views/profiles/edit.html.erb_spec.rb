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

    rendered.should have_selector("form", :action => profile_path, :method => "post") do |form|
      form.should have_selector("label", :for => 'profile_name_attributes_first' ) do |label|
        label.text.should == t('profiles.first_name').capitalize
      end
      form.should have_selector("label" , :for => 'profile_name_attributes_last') do |label|
        label.text.should == t('profiles.last_name').capitalize
      end
      form.should have_selector("label", :for => 'profile_birthday' ) do |label|
        label.text.should == t('profiles.birthday').capitalize
      end
      form.should have_selector("label", :for => 'profile_picture' ) do |label|
        label.text.should == t('profiles.picture').capitalize
      end
      form.should have_selector("input", :type => 'text', :name => 'profile[name_attributes][first]' )
      form.should have_selector("input", :type => 'text', :name => 'profile[name_attributes][last]' )
      form.should have_selector("select",  :name => 'profile[birthday(1i)]' )
      form.should have_selector("select",  :name => 'profile[birthday(2i)]' )
      form.should have_selector("select",  :name => 'profile[birthday(3i)]' )
    end
  end
end
