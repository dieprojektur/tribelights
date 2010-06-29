require 'spec_helper'

describe "accounts/edit.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :new_record? => false,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    rendered.should have_selector("form", :action => account_path(@account), :method => "post") do |form|
      form.should have_selector("input#account_first_name", :name => "account[first_name]")
      form.should have_selector("input#account_last_name", :name => "account[last_name]")
    end
  end
end
