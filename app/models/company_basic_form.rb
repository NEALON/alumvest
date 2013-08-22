class CompanyBasicForm < ActiveRecord::Base

  attr_accessible :name,
                  :ownership_structure,
                  :logo_url,
                  :url,
                  :address_1,
                  :address_2,
                  :city,
                  :state,
                  :zip,
                  :phone,
                  :founded_on,
                  :summary,
                  :category_id,
                  :industry_id,
                  :company_worksheet_id,
                  :status

  has_filepicker_image :logo, :styles => {:medium => [300, 300], :thumb => [100, 100]}

  belongs_to :company_worksheet
  belongs_to :category
  belongs_to :industry

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:name,
       :ownership_structure,
       :logo_url,
       :url,
       :address_1,
       :city,
       :state,
       :zip,
       :phone,
       :founded_on,
       :summary,
       :category_id,
       :industry_id].each do |attr|
        validates attr, :presence => true
      end
    end
  end
end