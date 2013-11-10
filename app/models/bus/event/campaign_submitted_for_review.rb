class Bus::Event::CampaignSubmittedForReview < Bus::Event
  attr_accessible :campaign, :campaign_id

  belongs_to :campaign

  after_create :do_next_stuff

  def do_next_stuff
  end
end
