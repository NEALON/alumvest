class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :facebook, :twitter, :linkedin, :avatar_url

  validates_presence_of [:first_name, :last_name]

  belongs_to :populatable, :polymorphic => true

  has_filepicker_image :avatar, :styles => {:medium => [300, 300], :thumb => [100, 100]}

  def full_name
    "#{first_name} #{last_name}"
  end
end