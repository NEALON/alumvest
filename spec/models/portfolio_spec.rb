require File.dirname(__FILE__) + '/../spec_helper'

describe Portfolio do
  it "should be valid" do
    Portfolio.new.should be_valid
  end
end
