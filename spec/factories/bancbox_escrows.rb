require 'date'

FactoryGirl.define do
  factory :bancbox_escrow, :class => 'Bancbox::EscrowBase' do
    name Faker::Name.first_name
    start_date Date.today + 1
    close_date Date.today + 100
    funding_goal 1000000
    minimum_funding_amount 10
    maximum_funding_amount 1000
    securities_offered "EQUITY"
    over_funding_amount 1000000
    issuer_signatory_email "kyle+test+escrow@alumvest.com"
    issuer_signatory_name "Kyle Escrow Issuer"
    issuer_signatory_title "Kyle Escrow Title"

    bancbox_id "932980869835"
  end

  factory :vcr_bancbox_escrow, :class => 'Bancbox::EscrowBase' do
    name Faker::Name.first_name
    start_date Date.today + 1
    close_date Date.today + 100
    funding_goal 1000000
    minimum_funding_amount 10
    maximum_funding_amount 1000
    securities_offered "EQUITY"
    over_funding_amount 1000000
    issuer_signatory_email "kyle+test+escrow@alumvest.com"
    issuer_signatory_name "Kyle Escrow Issuer"
    issuer_signatory_title "Kyle Escrow Title"
  end

  # This one has been whitelisted by bancbox
  # {"request_id"=>470889304030, "id"=>932980869835, "project_name"=>"Test", "current_balance"=>0.0, "notional_balance"=>0.0, "status"=>"OPEN PENDING", "platform_signatory_name"=>"Lynn Chen", "platform_signatory_title"=>"CEO", "platform_signatory_email"=>"kyle@alumvest.com", "issuer_id"=>827082397280, "issuer_reference_id"=>"d30f4e0c-a56a-4977-8b4b-b98255fafaf3", "issuer_signatory_name"=>"Kyle O2", "issuer_signatory_title"=>"EEE", "issuer_signatory_email"=>"kyle@alumvest.com", "minimum_amount"=>10.0, "maximum_amount"=>10000.0, "funding_goal"=>10000.0, "over_funding_amount"=>0.0, "start_date"=>"2013-12-10", "close_date"=>"2014-10-01", "securities_offered"=>"EQUITY", "initiated_on"=>"2013-12-01", "initiated_by"=>"Kyle Sun", "created_on"=>"2013-12-01", "created_by"=>"Kyle Sun", "modified_on"=>"2013-12-01", "modified_by"=>"Kyle Sun", "cfp_name"=>"Angelshares LLC", "total_amount_escrowed"=>0.0, "disbursement_status"=>"UNLOCKED", "deal"=>"0", "disbursal_started"=>"NO"}

  factory :vcr_established_bancbox_escrow, :class => 'Bancbox::EscrowBase' do
    name "Test"
    start_date Date.new(2013,12,10)
    close_date Date.new(2014,10,1)
    funding_goal 10000
    minimum_funding_amount 10
    maximum_funding_amount 1000
    securities_offered "EQUITY"
    over_funding_amount 0
    issuer_signatory_email "kyle@alumvest.com"
    issuer_signatory_name "Kyle O2"
    issuer_signatory_title "EEE"

    bancbox_id "932980869835"
  end

  factory :kyle_bancbox_escrow, :class => 'Bancbox::EscrowBase' do
    name "Kyle Oa"
    start_date Date.today + 1
    close_date Date.today + 1000
    funding_goal 1000000
    minimum_funding_amount 10
    maximum_funding_amount 1000
    securities_offered "EQUITY"
    over_funding_amount 1000000
    issuer_signatory_email "kyle+oa@alumvest.com"
    issuer_signatory_name "Kyle Oa"
    issuer_signatory_title "Kyle Oa Title"
  end
end
