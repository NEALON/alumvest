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
  attr_encrypted :ssn, :key => (Rails.env.test? ? 'ssn_secret' : ENV['SSN_SECRET'])

  validates_presence_of  [:ssn, :first_name, :last_name, :address, :city, :state, :zip_code, :email]

  belongs_to :investor

  def complete!
    update_attribute(:status, 'completed')
    Bus::Event::VeritaxEvent::OrderSubmittedSuccessfully.create(
        :investor => investor,
        :veritax_order => self)
  end

  def completed?
    status == 'completed'
  end

  def error!
    update_attribute(:status, 'errored')
    Bus::Event::VeritaxEvent::OrderSubmittedWithError.create(
        :investor => investor,
        :veritax_order => self)
  end

  def error?
    status == 'errored'
  end

  def vt_status_changed!(current_status, new_status)

    if current_status.blank? && new_status == 'Completed'
      Bus::Event::VeritaxEvent::OrderCompleted.create(
          :veritax_order => self,
          :investor => investor)
    end
    if current_status.blank? && new_status == 'Canceled'
      Bus::Event::VeritaxEvent::OrderCanceled.create(
          :veritax_order => self,
          :investor => investor)
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

  def when_not_completed(&block)
    if status != 'completed'
      yield
    end
  end
end
