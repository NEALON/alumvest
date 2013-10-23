class DocusignEnvelope < ActiveRecord::Base
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
            :return_url => 'http://localhost:300/'
        }
    )
  end
end
