module Alumvest
  class Job < ActiveRecord::Base
    belongs_to :company, :class_name => 'Alumvest::Company::Base'

    attr_accessible :contact, :description, :title, :company, :company_id
    validates_presence_of [:contact, :title, :description]
  end
end