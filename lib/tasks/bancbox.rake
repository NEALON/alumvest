namespace :bancbox do
  desc 'TODO'
  task update_investors: :environment do
  end

  desc 'TODO'
  task update_issuers: :environment do
  end

  desc 'Update escrow accounts'
  task update_escrow_accounts: :environment do
    Bancbox::EscrowBase.all.each do |e|
      p "Updating escrow ##{e.id}: #{e.name}"
      e.update_from_server!
    end
  end
end
