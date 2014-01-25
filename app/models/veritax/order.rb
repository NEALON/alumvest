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
                  :vt_error,
                  :vt_status,
                  :vt_transcript,
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
    Bus::Event::Veritax::OrderSubmittedSuccessfully.create(:investor => investor, :veritax_order => self)
  end

  def completed?
    status == 'completed'
  end

  def error!
    update_attribute(:status, 'errored')
    Bus::Event::Veritax::OrderSubmittedWithError.create(:investor => investor, :veritax_order => self)
  end

  def error?
    status == 'errored'
  end

  def vt_status_changed!(current_status, new_status)
    if current_status.blank? && new_status == 'Completed'
      Bus::Event::Veritax::OrderCompleted.create(:veritax_order => self, :investor => investor)
    end
    update_attribute(:vt_status, new_status)
  end

  def create_via_veritax!
    response = Veritax::TalksToVeritax.new.create_esign4506_order(self)

    if response.success?
      result = Veritax::OrderResult.new(
          response.body[:create_esign4506_order_response][:create_esign4506_order_result])
      if result.success?
        update_attribute(:vt_order_id, result.order_id)
        complete!
      else
        update_attribute(:vt_error, result.message)
        error!
      end
    else
      # TODO, cannot process verisign order
      raise response.inspect
    end
  end

  def get_order_info!
    response = Veritax::TalksToVeritax.new.get_order_info(vt_order_id)
    if response.success?
      info = Veritax::OrderInfo.new(
          response.body[:get_order_info_response][:get_order_info_result])
      if info.status != vt_status
        vt_status_changed!(vt_status, info.status)
      end
    else
      # TODO log this information and continue
    end
  end

  def get_transcript!
    response = Veritax::TalksToVeritax.new.get_transcript(vt_order_id)
    result = Veritax::TranscriptResult.new(response.body[:get_transcript_response][:get_transcript_result])
    update_attribute(:vt_transcript, result.document_bytes)
    vt_transcript
  end

  def transcript_file_name
     "/#{SecureRandom.uuid}.pdf"
  end

  def when_not_completed(&block)
    if status != 'completed'
      yield
    end
  end

  # and we can have a task to sync those orders with their status on veritax and fire internal events accordingly, so that downstream stuff can happen like notifying an admin to review a result and subsequent workflows
  # that would talk to things here
end
