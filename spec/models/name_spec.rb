require 'spec_helper'

describe Name do
  it "should have first and last name" do
    name = Name.new
    name.first = 'Jack'
    name.last = 'Black'
    name.should be_valid
  end
end
