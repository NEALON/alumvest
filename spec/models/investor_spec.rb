require File.dirname(__FILE__) + '/../spec_helper'

describe Investor do
  it "should be valid" do
    Investor.new.should be_valid
  end
end
