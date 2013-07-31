require File.dirname(__FILE__) + '/../spec_helper'

describe BorrowerCredit do
  it "should be valid" do
    BorrowerCredit.new.should be_valid
  end
end
