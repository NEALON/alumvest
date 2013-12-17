namespace :bancbox do
  desc "TODO"
  task update_investors: :environment do
  end

  desc "TODO"
  task update_issuers: :environment do
  end

  desc "Update escrows"
  task update_escrows: :environment do
    Bancbox::Escrow.all.each do |e|
      p "Updating escrow ##{e.id}: #{e.name}"
      e.update_from_server!
    end
  end
end
