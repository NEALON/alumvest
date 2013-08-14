class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :company_basic_forms
end
