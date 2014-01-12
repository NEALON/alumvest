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
  attr_encrypted :ssn, :key => 'secret'

  #state_machine :status, :initial => :new do
  #  event :complete do
  #    transition :new => :completed
  #  end
  #  state :new
  #  state :completed
  #  state :submission_error
  #end

  validates_presence_of  [:ssn, :first_name, :last_name, :address, :city, :state, :zip_code, :email]

  belongs_to :investor

  def complete!
    update_attribute(:status, 'completed')
  end

  def completed?
    status == 'completed'
  end

  def create_via_veritax!
    response = Veritax::TalksToVeritax.new.create_esign4506_order(self)

    if response.success?
      result = Veritax::OrderResult.new(response.body[:create_esign4506_order_response][:create_esign4506_order_result])
      if result.success?
        update_attribute(:vt_order_id, result.order_id)
        complete!
      else
        # TODO: veritax returns an error
        raise result.inspect
      end
    else
      # TODO, cannot process verisign order
      raise response.inspect
    end
  end

  def when_unsubmitted(&block)
    if status == 'unsubmitted'
      yield
    end
  end

  # and we can have a task to sync those orders with their status on veritax and fire internal events accordingly, so that downstream stuff can happen like notifying an admin to review a result and subsequent workflows
  # that would talk to things here
  # true
end
