class Veritax::Order < ActiveRecord::Base

  attr_accessible :investor,
                  :investor_id,
                  :ssn,
                  :first_name,
                  :last_name,
                  :address,
                  :city,
                  :state,
                  :zip_code,
                  :previous_address,
                  :previous_city,
                  :previous_state,
                  :previous_zip,
                  :email,
                  :vt_order_id,
                  :status

  belongs_to :investor

  def self.create_via_veritax
    TalksToVeritax.new.create_esigned_order(self)
  end

  # so we need an entity to represent that order
  # and we can have a task to sync those orders with their status on veritax and fire internal events accordingly, so that downstream stuff can happen like notifying an admin to review a result and subsequent workflows
  # that would talk to things here
  # true

end
