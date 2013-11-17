class BancboxIssuer < BancboxPersonBase

  attr_accessible :company_name, :company_type, :company_registration_state, :company_tax_id

  belongs_to :user

  def submit!
    super do |common_options|
      options = {
        :company_name => self.company_name,
        :company_type => self.company_type,
        :company_registration_state => self.company_registration_state,
        :company_tax_id => self.company_tax_id,
      }
      options.merge!(common_options)
      return BancBoxCrowd.create_issuer options
    end
  end

end
