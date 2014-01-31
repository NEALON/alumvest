module Alumvest::Signing
  class Base < ActiveRecord::Base
    include Alumvest::Signing::Data
    include Alumvest::Signing::Presenters
    include Alumvest::Signing::State

    def remove_investor_reviewer
      # TODO: let envelope do this
      client = DocusignRest::Client.new
      envelope_id = envelope.envelope_id
      recipients = client.get_envelope_recipients(:envelope_id => envelope_id)
      recipient_id = recipients['signers'].select{|s| s["roleName"] == "investor-reviewer"}.first["recipientId"]
      result = client.delete_envelope_recipient({:envelope_id => envelope_id, :recipient_id => recipient_id})
      begin
        result['signers'].first['status'] == 'deleted'
      rescue
        # TODO: log some stuff, eh?
        false
      end
    end
  end
end