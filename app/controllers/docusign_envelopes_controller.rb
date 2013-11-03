class DocusignEnvelopesController < ApplicationController

  def record_event
    envelope = DocusignEnvelope.find_by_envelope_id(params[:docusign_envelope_id])
    unless envelope.blank?
      envelope.events <<
          DocusignEnvelopeEvent.create(
              :docusign_envelope => envelope,
              :status => params[:event],
              :status_date_time => Time.now)

      finalization = envelope.signing.investment_finalization

      redirect_to new_campaign_investment_finalization_contract_doc_group_path(
                      finalization.campaign,
                      finalization),
                  :flash => {
                      :success => "Document signing status has been updated."}

    else
      redirect_to root_path, :flash => {:warning => "Could not update envelope."}
    end
  end
end
