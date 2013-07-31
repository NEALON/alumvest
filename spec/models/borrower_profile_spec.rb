require File.dirname(__FILE__) + '/../spec_helper'

describe BorrowerProfile do
  it "should be valid" do
    BorrowerProfile.new.should be_valid
  end
end
