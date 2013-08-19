class CompanyBasicForm < ActiveRecord::Base
  #include HasFilepickerImage::Base::ClassMethods

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
                  :company_worksheet_id

  has_filepicker_image :logo, :styles => {:medium => [300, 300], :thumb => [100, 100]}

  belongs_to :company_worksheet
  belongs_to :category
  belongs_to :industry
end