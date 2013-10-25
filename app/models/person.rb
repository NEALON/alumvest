class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :facebook, :twitter, :linkedin, :avatar_url, :video_url, :introduction

  validates_presence_of [:first_name, :last_name, :title]

  belongs_to :populatable, :polymorphic => true

  has_many :educations, dependent: :destroy
  attr_accessible :educations_attributes
  accepts_nested_attributes_for :educations, allow_destroy: true

  has_filepicker_image :avatar, :styles => {:medium => [300, 300], :thumb => [100, 100]}

  def full_name
    "#{first_name} #{last_name}"
  end
end
