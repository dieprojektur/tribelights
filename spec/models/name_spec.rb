require 'spec_helper'

describe Name do
  it "should have first and last name" do
    name = Factory.build(:name)
    name.should be_valid
  end
  it "should require a first name" do
    name = Factory.build(:valid_name)
    name.first = nil
    name.should_not be_valid
  end

  it "should require a last name" do
    name = Factory.build(:valid_name)
    name.last = nil
    name.should_not be_valid
  end
end
