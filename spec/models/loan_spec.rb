require File.dirname(__FILE__) + '/../spec_helper'

describe Loan do
  it "should be valid" do
    Loan.new(:amount_requested => 1).should be_valid
  end
end
