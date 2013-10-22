require File.dirname(__FILE__) + '/../spec_helper'

describe "docusign", :type => :feature do


  it "works" do
    @client = DocusignRest::Client.new
    login_info = @client.get_login_information

    @template_response = @client.create_template(
      description: 'Template Description',
      name: "Template Name 1",
      signers: [
        {
          embedded: true,
          name: 'Mike',
          email: 'mike@medstartr.com',
          role_name: 'Issuer',
          sign_here_tabs: [
            {
              anchor_string: 'issuer_sig',
              anchor_x_offset: '140',
              anchor_y_offset: '8'
            }
          ]
        },
      ],
      files: [
        {path: Rails.root + '/public/sample.pdf', name: 'sample.pdf'}
      ]
    )

    true
  end
end
