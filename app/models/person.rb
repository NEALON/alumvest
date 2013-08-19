class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  validates_presence_of [:first_name, :last_name]

  belongs_to :populatable, :polymorphic => true

  def full_name
    "#{first_name} #{last_name}"
  end
end