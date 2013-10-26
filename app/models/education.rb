class Education < ActiveRecord::Base
  belongs_to :person
  belongs_to :user
  attr_accessible :degree, :school, :person_id, :user_id
end
