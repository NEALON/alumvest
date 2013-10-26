class DocusignEnvelope < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  delegate :default_url_options, to: ActionMailer::Base

  attr_accessible :envelope_id, :email_body, :email_subject, :uri, :template_id

  belongs_to :docusign_template
  has_many :events, :class_name => DocusignEnvelopeEvent

  def get_recipient_view
    client = DocusignRest::Client.new
    view = client.get_recipient_view(
        {
            :envelope_id => envelope_id,
            :name =>  'Mike Pence',
            :email => 'mike.pence@gmail.com',
            :return_url => root_url + "/docusign_envelopes/#{envelope_id}/record_event"
        }
    )
  end
end
