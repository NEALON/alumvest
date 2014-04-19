require 'active_support/concern'

module Veritax::OrderVeritaxCalls
  extend ActiveSupport::Concern

  included do
    def create_via_veritax!
      response = Veritax::TalksToVeritax.new.create_esign4506_order(self)

      if response.success?
        result = Veritax::OrderResult.new(
            response.body[:create_esign4506_order_response][:create_esign4506_order_result])
        if result.success?
          update_attribute(:vt_order_id, result.order_id)
          submit!
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
        update_attribute(:vt_status, info.status)
        case info.status
          when 'Completed'
            complete!
          when 'Canceled'
            cancel!
          else
            raise "Unhandled Veritax order status: #{vt_status}"
        end
      else
        raise "Unhandled condition encountered retrieving order info: #{response.inspect}"
      end
    end

    def get_transcript!
      response = Veritax::TalksToVeritax.new.get_transcript(vt_order_id)
      result = Veritax::TranscriptResult.new(response.body[:get_transcript_response][:get_transcript_result])
      update_attribute(:vt_transcript, result.document_bytes)
      vt_transcript
    end
  end
end