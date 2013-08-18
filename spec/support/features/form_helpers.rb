module Features
  module FormHelpers

    def fill_in_ckeditor(item, value)
      page.driver.browser.execute_script("CKEDITOR.instances['#{item}'].setData('#{value}');")
    end

    def fill_in_user_basic_info(
          first_name = Faker::Name.first_name,
          middle_name = Faker::Name.first_name,
          last_name = Faker::Name.last_name
        )
      'user'.tap do |form|
        fill_in "#{form}_first_name", :with => first_name
        fill_in "#{form}_middle_name", :with => middle_name
        fill_in "#{form}_last_name", :with => last_name
      end
      click_button 'Save'
    end

    def fill_in_user_advanced_info(
          mobile_phone = Faker::PhoneNumber.cell_phone,
          home_phone = Faker::PhoneNumber.phone_number,
          address1 = Faker::Address.street_address,
          city = Faker::Address.city,
          state = Faker::Address.state,
          zip_code = Faker::Address.zip_code,
          ps = Faker::Lorem.sentence(10)
        )
      'user'.tap do |form|
        select '1988', :from => "#{form}_date_of_birth_1i"
        select 'January', :from => "#{form}_date_of_birth_2i"
        select '1', :from => "#{form}_date_of_birth_3i"
        fill_in "#{form}_mobile_phone", :with => mobile_phone
        fill_in "#{form}_home_phone", :with => home_phone
        fill_in "#{form}_address_1", :with => address1
        fill_in "#{form}_city", :with => city
        fill_in "#{form}_state", :with => state
        fill_in "#{form}_zipcode", :with => zip_code
        fill_in_ckeditor "#{form}_personal_statement", ps
      end
      click_button 'Save'
    end

    def fill_in_user_owner_profile
      'user'.tap do |form|
        fill_in "#{form}_owner_attributes_ssn", :with => '000-00-0000'
        select 'Married', :from => "#{form}_owner_attributes_marital_status"
        fill_in_ckeditor "#{form}_owner_attributes_financial_info", Faker::Lorem.sentence(10)
        fill_in_ckeditor "#{form}_owner_attributes_experience", Faker::Lorem.sentence(10)
        fill_in_ckeditor "#{form}_owner_attributes_expertise", Faker::Lorem.sentence(10)
        fill_in_ckeditor "#{form}_owner_attributes_personal_message", Faker::Lorem.sentence(10)
      end
      click_button 'Save'
    end

    def fill_in_user_investor_profile
      'user'.tap do |form|
        fill_in "#{form}_investor_attributes_ssn", :with => '000-00-0000'
        select 'Married', :from => "#{form}_investor_attributes_marital_status"
        fill_in_ckeditor "#{form}_investor_attributes_financial_info", Faker::Lorem.sentence(10)
        fill_in "#{form}_investor_attributes_experience", :with => Faker::Lorem.sentence(10)
        fill_in "#{form}_investor_attributes_expertise", :with => Faker::Lorem.sentence(10)
        fill_in_ckeditor "#{form}_investor_attributes_personal_message", Faker::Lorem.sentence(10)
      end
      click_button 'Save'
    end

    def fill_in_campaign
      'campaign'.tap do |form|
        fill_in "#{form}_permalink", :with => Faker::Lorem.word
        fill_in "#{form}_title", :with => Faker::Lorem.sentence(4)
        fill_in "#{form}_headline", :with => Faker::Lorem.sentence(10)
        fill_in "#{form}_summary", :with => Faker::Lorem.sentence(20)
        fill_in "#{form}_pitch", :with => "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
        fill_in "#{form}_amount", :with => 100
        fill_in "#{form}_planned_fund_usage", :with => "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
        fill_in "#{form}_length_in_days", :with => 90
        fill_in "#{form}_video_url", :with => 'http://www.youtube.com/watch?v=OQSNhk5ICTI'
      end
      click_button 'Save changes'
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
        fill_in "#{form}_product_media_url", :with => 'http://www.youtube.com/watch?v=OQSNhk5ICTI'
        fill_in_ckeditor "#{form}_market_info", Faker::Lorem.sentence(6)
        fill_in_ckeditor "#{form}_competitive_landscape", Faker::Lorem.sentence(6)
      end

      click_button 'Save changes'
    end
  end
end
