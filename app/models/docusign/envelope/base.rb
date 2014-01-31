module Docusign::Envelope
  class Base < ActiveRecord::Base
    include Rails.application.routes.url_helpers
    delegate :default_url_options, to: ActionMailer::Base

    include Docusign::Envelope::Data
    include Docusign::Envelope::DocusignCalls
  end
end