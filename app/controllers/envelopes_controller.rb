class EnvelopesController < ApplicationController

  def record_event
    envelope = Envelope.find_by_envelope_id(params[:envelope_id])
    unless envelope.blank?
      envelope.events <<
          EnvelopeEvent.create(
              :envelope => envelope,
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

  def signed_document
    filename = "#{Time.now.to_i}.pdf"
    envelope = Envelope.find(params[:envelope_id])
    client = DocusignRest::Client.new
    result = client.get_document_from_envelope(
        :envelope_id => envelope.envelope_id,
        :document_id => 1,
        :local_save_path => "#{Rails.root}/public/#{filename}")

    if result.is_a?(File)
      redirect_to "/#{filename}"
    else
      # TODO: some logging
      redirect_to :back, :flash => {:error => "Error retrieving file."}
    end
  end
end
