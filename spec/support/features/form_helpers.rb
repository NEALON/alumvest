module Features
  module FormHelpers
    def fill_in_company_basic_form
      'company_basic_form'.tap do |form|
        fill_in "#{form}_name", :with => Faker::Lorem.sentence(3)
        select 'Corporation', :from => "#{form}_ownership_structure"
        fill_in "#{form}_logo_url", :with => Faker::Internet.url
        fill_in "#{form}_url", :with => Faker::Internet.url
        fill_in "#{form}_address_1", :with => Faker::Address.street_address
        fill_in "#{form}_address_2", :with => Faker::Address.secondary_address
        fill_in "#{form}_city", :with => Faker::Address.city
        fill_in "#{form}_state", :with => Faker::Address.state_abbr
        fill_in "#{form}_zip", :with => Faker::Address.zip_code
        fill_in "#{form}_phone", :with => Faker::PhoneNumber.phone_number
        select '2008', :from => "#{form}_founded_on_1i"
        select 'January', :from => "#{form}_founded_on_2i"
        select '1', :from => "#{form}_founded_on_3i"
        fill_in "#{form}_summary", :with => Faker::Lorem.sentence(20)
        select @category.name, :from => "#{form}_category_id"
        select @industry.name, :from => "#{form}_industry_id"
      end

      click_button "Create Company basic form"
    end

    def fill_in_company_funding_doc_form
      'company_funding_doc_form'.tap do |form|
        fill_in "#{form}_business_plan_url", :with => Faker::Internet.url
        fill_in "#{form}_tbd_financial_document_url", :with => Faker::Internet.url
        fill_in "#{form}_tbd_funding_document_url", :with => Faker::Internet.url
        fill_in "#{form}_tbd_detailed_metrics_document_url", :with => Faker::Internet.url
        fill_in "#{form}_recent_investors", :with => Faker::Lorem.sentence(6)
        fill_in "#{form}_roadmap", :with => Faker::Lorem.sentence(6)
        fill_in "#{form}_shareholder_message", :with => Faker::Lorem.sentence(6)
      end

      click_button "Create Company funding doc form"
    end

    def fill_in_company_personnel_form
      'company_personnel_form'.tap do |form|
        'legal_counsel'.tap do |entity|
          fill_in "#{form}_#{entity}_attributes_0_first_name", :with => Faker::Name.first_name
          fill_in "#{form}_#{entity}_attributes_0_last_name", :with => Faker::Name.last_name
        end
        'founders'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
        end
        'team_members'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
        end
        'board_members'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
        end
        'advisors'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
        end
      end

      click_button "Create Company personnel form"
    end

    def fill_in_company_market_form
      'company_market_form'.tap do |form|
        fill_in "#{form}_product_media_url", :with => Faker::Internet.url
        fill_in "#{form}_market_info", :with => Faker::Lorem.sentence(6)
        fill_in "#{form}_competitive_landscape", :with => Faker::Lorem.sentence(6)
      end

      click_button "Create Company market form"
    end
  end
end