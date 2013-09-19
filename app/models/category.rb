class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :companies

  def self.for_select
    select([:id, :name]).order(:name).collect{|p| [ p.name, p.id ]}
  end
end
