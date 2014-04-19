class Alumvest::CategoryBase < ActiveRecord::Base
  attr_accessible :name

  self.table_name = :categories

  has_many :companies,
           :class_name => 'Alumvest::CompanyBase',
           :foreign_key => 'category_id'

  def self.for_select
    select([:id, :name]).order(:name).collect { |p| [p.name, p.id] }
  end
end
