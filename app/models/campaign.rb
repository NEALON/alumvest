class Campaign < ActiveRecord::Base
  attr_accessible :permalink,
                  :title,
                  :headline,
                  :summary,
                  :pitch,
                  :amount,
                  :planned_fund_usage,
                  :length_in_days,
                  :photo_url,
                  :video_url,
                  :company_worksheet_id

  validates_presence_of [:permalink,
                    :title,
                    :headline,
                    :summary,
                    :pitch,
                    :amount,
                    :planned_fund_usage,
                    :length_in_days,
                    :photo_url,
                    :video_url]

  validates_numericality_of [:amount, :length_in_days]

  belongs_to :company_worksheet

  has_filepicker_image :photo
end
