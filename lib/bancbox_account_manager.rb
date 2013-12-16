class BancboxAccountManager

  def self.banking_account_updated!(user, bank_account)

    if user.is_investor?
      investor = user.investor
      bancbox_investor = investor.bancbox_investor ||
          Bancbox::Investor.create(:investor => investor, :investor_type => 'Individual/LLC', :agreement => true)
      # TODO yuck, let's remove this redundancy:
      bancbox_investor.populate_fields_from_user(user)
      unless bancbox_investor.has_bancbox_account?
        if user.profile_complete?
          begin
            bancbox_investor.submit!(bank_account)
          rescue BancBoxCrowd::Error => e
            e
          end
        end
      end
    end
  end
end