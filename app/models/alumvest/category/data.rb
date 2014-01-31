require 'active_support/concern'

module Alumvest::Category::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :name

    self.table_name = :categories

    has_many :companies,
             :class_name => 'Alumvest::Company::Base',
             :foreign_key => 'category_id'

    def self.for_select
      select([:id, :name]).order(:name).collect { |p| [p.name, p.id] }
    end
  end
end