module Alumvest
  class Identity < OmniAuth::Identity::Models::ActiveRecord
    attr_accessible :first_name, :name, :last_name, :email, :password, :password_confirmation, :description

    validates_presence_of :first_name
    validates_uniqueness_of :email
    validates :email, :email => true

    belongs_to :user, :class_name => 'Alumvest::UserBase'
  end
end
