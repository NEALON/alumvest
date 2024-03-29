class EnvelopesController < ApplicationController

  def record_event
    envelope = Docusign::EnvelopeBase.find_by_envelope_id(params[:envelope_id])
    unless envelope.blank?
      envelope.events <<
          Docusign::EnvelopeEventBase.create(
              :envelope => envelope,
              :status => params[:event],
              :status_date_time => Time.now)

      investment = envelope.signing.investment

      redirect_to new_campaign_investment_contract_doc_group_path(
                      investment.campaign,
                      investment),
                  :flash => {
                      :success => 'Document signing status has been updated.'}
    else
      redirect_to root_path, :flash => {:warning => 'Could not update envelope.'}
    end
  end

  def signed_document
    filename = "#{Time.now.to_i}.pdf"
    envelope = Docusign::EnvelopeBase.find(params[:envelope_id])
    client = DocusignRest::Client.new
    result = client.get_document_from_envelope(
        :envelope_id => envelope.envelope_id,
        :document_id => 1,
        :local_save_path => "#{Rails.root}/public/#{filename}")

    if result.is_a?(File)
      redirect_to "/#{filename}"
    else
      # TODO: some logging
      redirect_to :back, :flash => {:warning => "Error retrieving file."}
    end
  end
end
