require File.dirname(__FILE__) + '/../spec_helper'

describe Coupon do
  it "should be valid" do
    Coupon.new.should be_valid
  end
end
