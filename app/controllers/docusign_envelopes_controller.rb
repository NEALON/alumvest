class DocusignEnvelopesController < ApplicationController

  def record_event
    envelope = DocusignEnvelope.find_by_envelope_id(params[:docusign_envelope_id])
    unless envelope.blank?
      #possible events:
      #signing_complete, declined, cancel
      envelope.events << DocusignEnvelopeEvent.create(:status => params[:event], :status_date_time => Time.now)
      # TODO, update related entities and re-direct to next step in the workflow
      redirect_to root_path, :flash => {:success => "Super!"}
    else
      # TODO: some logging
      redirect_to root_path, :flash => {:warning => "Could not update envelope."}
    end
  end
end
