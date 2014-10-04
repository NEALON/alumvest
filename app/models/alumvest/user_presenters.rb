require 'active_support/concern'

module Alumvest::UserPresenters
  extend ActiveSupport::Concern

  included do
    def full_name
      "#{first_name} #{last_name}"
    end

    def avatar_small
      avatar_url.blank? ? 'noavatar.gif' : avatar(:w => 40, :h => 40)
    end

    def address
      "#{address_1} #{address_2}"
    end

    def location
      "#{city}, #{state}"
    end

    def schools
      educations.map{|e| e.school}.join(', ')
    end
    
    def schools_array
      educations.map{|e| e.school}
    end
  end
end