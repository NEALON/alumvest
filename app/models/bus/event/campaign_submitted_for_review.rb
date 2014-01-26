class Bus::Event::CampaignSubmittedForReview < Bus::Event
  attr_accessible :campaign, :campaign_id

  belongs_to :campaign
end
