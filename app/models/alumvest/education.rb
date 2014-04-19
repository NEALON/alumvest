module Alumvest
  class Education < ActiveRecord::Base
    belongs_to :person, :class_name => 'Alumvest::PersonBase'
    belongs_to :user, :class_name => 'Alumvest::UserBase'
    attr_accessible :degree, :school, :person_id, :user_id
  end
end
