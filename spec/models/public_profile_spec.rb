require "spec/spec_helper"

describe PublicProfile do
  it "should be able to be instantiated" do
    p = PublicProfile.new
  end
  it "should have a name and birthday field" do
    p = Factory.create(:public_profile)
    p.name.should_not be_nil
    p.birthday.should_not be_nil
  end
end
