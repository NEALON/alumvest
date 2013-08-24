class CompanyBasicForm < ActiveRecord::Base

  attr_accessible :name,
                  :logo_url,
                  :url,
                  :title,
                  :headline,
                  :company_introductions,
                  :founded_on_year,
                  :ownership_structure,
                  :category_id,
                  :industry_id,
                  :address_1,
                  :address_2,
                  :city,
                  :state,
                  :zip,
                  :phone,
                  :photo_url,
                  :video_url,
                  :highlights,
                  :company_worksheet_id,
                  :status

  has_filepicker_image :logo, :styles => {:medium => [300, 300], :thumb => [100, 100]}
  has_filepicker_image :photo

  belongs_to :company_worksheet
  belongs_to :category
  belongs_to :industry

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:name,
       :logo_url,
       :url,
       :title,
       :headline,
       :company_introductions,
       :founded_on_year,
       :ownership_structure,
       :category_id,
       :industry_id,
       :address_1,
       :city,
       :state,
       :zip,
       :phone,
       :video_url,
       :highlights].each do |attr|
        validates attr, :presence => true
      end
    end
  end
end