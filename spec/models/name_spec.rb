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
  it "should be able to output the full name" do
    name = Factory.build(:valid_name)
    name.full.should == name.first + ' ' + name.last
  end
  it "should return nil if no name is set" do
    name = Name.new
    name.full.should be_nil
  end
end
