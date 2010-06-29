require 'spec_helper'

describe "accounts/new.html.erb" do
  before(:each) do
    assign(:account, stub_model(Account,
      :new_record? => true,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders new account form" do
    render

    rendered.should have_selector("form", :action => accounts_path, :method => "post") do |form|
      form.should have_selector("input#account_first_name", :name => "account[first_name]")
      form.should have_selector("input#account_last_name", :name => "account[last_name]")
    end
  end
end
