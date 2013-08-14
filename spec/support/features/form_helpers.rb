module Features
  module FormHelpers

    def fill_in_ckeditor(item, value)
      page.driver.browser.execute_script("CKEDITOR.instances['#{item}'].setData('#{value}');")
    end

    def fill_in_company_basic_form
      'company_basic_form'.tap do |form|
        fill_in "#{form}_name", :with => Faker::Lorem.sentence(3)
        # filepicker fill_in "#{form}_logo_url", :with => Faker::Internet.url
        select '2008', :from => "#{form}_founded_on_1i"
        select 'January', :from => "#{form}_founded_on_2i"
        select '1', :from => "#{form}_founded_on_3i"
        fill_in "#{form}_url", :with => Faker::Internet.url

        select 'Corporation', :from => "#{form}_ownership_structure"
        select @category.name, :from => "#{form}_category_id"
        select @industry.name, :from => "#{form}_industry_id"

        fill_in_ckeditor "#{form}_summary", Faker::Lorem.sentence(20)

        fill_in "#{form}_address_1", :with => Faker::Address.street_address
        fill_in "#{form}_address_2", :with => Faker::Address.secondary_address
        fill_in "#{form}_city", :with => Faker::Address.city
        fill_in "#{form}_state", :with => Faker::Address.state_abbr
        fill_in "#{form}_zip", :with => Faker::Address.zip_code
        fill_in "#{form}_phone", :with => Faker::PhoneNumber.phone_number
      end

      click_button 'Save changes'
    end

    def fill_in_company_funding_doc_form
      'company_funding_doc_form'.tap do |form|
        # filepicker fill_in "#{form}_business_plan_url", :with => Faker::Internet.url
        # filepicker fill_in "#{form}_tbd_financial_document_url", :with => Faker::Internet.url
        # filepicker fill_in "#{form}_tbd_funding_document_url", :with => Faker::Internet.url
        # filepicker fill_in "#{form}_tbd_detailed_metrics_document_url", :with => Faker::Internet.url
        fill_in_ckeditor "#{form}_recent_investors", Faker::Lorem.sentence(6)
        fill_in_ckeditor "#{form}_roadmap", Faker::Lorem.sentence(6)
        fill_in_ckeditor "#{form}_shareholder_message", Faker::Lorem.sentence(6)
      end

      click_button 'Save changes'
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

      click_button 'Save changes'
    end

    def fill_in_company_market_form
      'company_market_form'.tap do |form|
        fill_in "#{form}_product_media_url", :with => Faker::Internet.url
        fill_in_ckeditor "#{form}_market_info", Faker::Lorem.sentence(6)
        fill_in_ckeditor "#{form}_competitive_landscape", Faker::Lorem.sentence(6)
      end

      click_button 'Save changes'
    end
  end
end