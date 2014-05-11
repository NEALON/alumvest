class Bus::Event::BancboxEscrow::Opened < Bus::Event
  attr_accessible :campaign, :campaign_id,
                  :issuer, :issuer_id,
                  :bancbox_escrow, :bancbox_escrow_id

  belongs_to :campaign,
             :class_name => 'Alumvest::CampaignBase'
  belongs_to :bancbox_escrow,
             :class_name => 'Bancbox::EscrowBase'
  belongs_to :issuer,
             :class_name => 'Alumvest::IssuerBase'
end
