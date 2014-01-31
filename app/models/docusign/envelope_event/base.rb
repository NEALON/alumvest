module Docusign::EnvelopeEvent
  class Base < ActiveRecord::Base
    include Docusign::EnvelopeEvent::Data
  end
end

