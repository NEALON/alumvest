class BancboxIssuer < BancboxPersonBase

  attr_accessible :company_name, :company_type, :company_registration_state, :company_tax_id

  validate :validates_company_fields

  belongs_to :user

  def validates_company_fields
    # all or nothing for company infos
    unless [
        self.company_name.blank?,
        self.company_registration_state.blank?,
        self.company_tax_id.blank?
    ].uniq.length == 1
      errors.add(:company_name, "can't be blank") if self.company_name.blank?
      errors.add(:company_registration_state, "can't be blank") if self.company_registration_state.blank?
      errors.add(:company_tax_id, "can't be blank") if self.company_tax_id.blank?
    end
  end

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

  def get_details
    super do |options|
      return BancBoxCrowd.get_issuer_details options
    end
  end

end
