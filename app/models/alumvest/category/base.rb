module Alumvest::Category
  class Base < ActiveRecord::Base
    include Alumvest::Category::Data
  end
end
