class DocusignEnvelopesController < ApplicationController

  def record_event
    envelope = DocusignEnvelope.find_by_envelope_id(params[:docusign_envelope_id])
    unless envelope.blank?
      # possible events: signing_complete, declined, cancel
      envelope.events << DocusignEnvelopeEvent.create(:status => params[:event], :status_date_time => Time.now)
      redirect_to campaign_investment_finalization_contract_doc_group(envelope.signing.investment_finalization), :flash => {:success => "Document signing status has been updated."}
    else
      redirect_to root_path, :flash => {:warning => "Could not update envelope."}
    end
  end
end
