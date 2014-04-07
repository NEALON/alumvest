module Alumvest::User

  class Base < ActiveRecord::Base

    include Alumvest::User::Data
    include Alumvest::User::Roles

    before_save :update_user_type
    after_create :send_welcome_email

    def full_name
      "#{first_name} #{last_name}"
    end

    def send_welcome_email
      UserMailer.welcome_email(self).deliver
    end

    def following?(campaign)
      follows.exists?(campaign_id: campaign.id)
    end

    def follow!(campaign)
      follows.create!(campaign_id: campaign.id)
    end

    def unfollow!(campaign)
      f = campaign.follows.find_by_user_id(id)
      f.destroy unless f.nil?
    end

    def avatar_small
      avatar_url.blank? ? '/images/user_24.png' : avatar(w: 24, h: 24)
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
  end
end
