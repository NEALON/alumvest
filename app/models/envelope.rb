class Envelope < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  delegate :default_url_options, to: ActionMailer::Base

  attr_accessible :envelope_id, :email_body, :email_subject, :uri, :template_id, :signing

  belongs_to :template
  belongs_to :signing

  has_many :events, :class_name => EnvelopeEvent

  def get_recipient_view
    client = DocusignRest::Client.new
    view = client.get_recipient_view(
        {
            :envelope_id => envelope_id,
            :name =>  'Mike Pence',
            :email => 'mike.pence@gmail.com',
            :return_url => root_url + "envelopes/#{envelope_id}/record_event"
        }
    )
  end

  def post_new_status(status)
    # For now, just pass it up the hierarchy. In the near future, we will do some more info to validate the status retrieval
    signing.post_new_status(status)
  end
end
