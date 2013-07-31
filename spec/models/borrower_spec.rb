require File.dirname(__FILE__) + '/../spec_helper'

describe Borrower do
  it "should be valid" do
    Borrower.new.should be_valid
  end
end
