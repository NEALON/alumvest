module Docusign::Template
  class Base < ActiveRecord::Base
    include Docusign::Template::Data
    include Docusign::Template::DocusignCalls
  end
end
