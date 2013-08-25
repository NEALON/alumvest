module Features
  module FormHelpers
    def fill_in_ckeditor(item, value)
      sleep 1
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
      screenshot_and_save_page if $do_screenshots
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
      screenshot_and_save_page if $do_screenshots
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
      screenshot_and_save_page if $do_screenshots
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
      screenshot_and_save_page if $do_screenshots
      click_button 'Save'
    end

    def fill_in_campaign
      c = FactoryGirl.build(:campaign)
      'campaign'.tap do |form|
      end
      screenshot_and_save_page if $do_screenshots
      click_button 'Save changes'
    end

    def fill_in_company_basic_form
      cbf = FactoryGirl.build(:company_basic_form)
      'company_basic_form'.tap do |form|
        fill_in "#{form}_name", :with => cbf.name
        # filepicker fill_in "#{form}_logo_url", :with => Faker::Internet.url
        fill_in "#{form}_permalink", :with => cbf.permalink
        fill_in "#{form}_url", :with => cbf.url
        fill_in "#{form}_title", :with => cbf.title
        fill_in "#{form}_headline", :with => cbf.headline
        fill_in_ckeditor "#{form}_company_introductions", cbf.company_introductions
        fill_in_ckeditor "#{form}_pitch", cbf.pitch
        select cbf.founded_on_year, :from => "#{form}_founded_on_year"
        select cbf.ownership_structure, :from => "#{form}_ownership_structure"
        select cbf.category.name, :from => "#{form}_category_id"
        select cbf.industry.name, :from => "#{form}_industry_id"
        fill_in "#{form}_address_1", :with => cbf.address_1
        fill_in "#{form}_address_2", :with => cbf.address_2
        fill_in "#{form}_city", :with => cbf.city
        fill_in "#{form}_state", :with => cbf.state
        fill_in "#{form}_zip", :with => cbf.zip
        fill_in "#{form}_phone", :with => cbf.phone
        # filepicker fill_in "#{form}_photo_url", :with => Faker::Internet.url
        fill_in "#{form}_video_url", :with =>  'http://www.youtube.com/embed/OQSNhk5ICTI'

        fill_in_ckeditor "#{form}_highlights", cbf.highlights
      end
      screenshot_and_save_page if $do_screenshots
      click_button 'Save changes'
    end

    def fill_in_investment_term
      investment_term = FactoryGirl.build(:investment_term)
      'investment_term'.tap do |form|
        fill_in "#{form}_fundraising_amount", :with => investment_term.fundraising_amount
        select 'All-or-nothing', :from => "#{form}_funds_retained"
        select 'Convertible Note', :from => "#{form}_equity_type"
        fill_in "#{form}_planned_fund_usage", :with => investment_term.planned_fund_usage
        select '90', :from => "#{form}_campaign_length"

        # filepicker fill_in "#{form}_business_plan_url", investment_term.business_plan_url
        # filepicker fill_in "#{form}_tbd_financial_document_url", :with => investment_term.tbd_financial_document_url
        # filepicker fill_in "#{form}_tbd_funding_document_url", :with => investment_term.tbd_funding_document_url
        # filepicker fill_in "#{form}_tbd_detailed_metrics_document_url", :with => investment_term.tbd_detailed_metrics_document_url
        fill_in_ckeditor "#{form}_recent_investors", investment_term.recent_investors
        fill_in_ckeditor "#{form}_roadmap", investment_term.roadmap
        fill_in_ckeditor "#{form}_shareholder_message", investment_term.shareholder_message
      end
      screenshot_and_save_page if $do_screenshots
      click_button 'Save changes'
    end

    def fill_in_team
      team = create_personnel_form_via_factories

      'team'.tap do |form|
        ['legal_counsel', 'founders', 'team_members', 'board_members', 'advisors'].each do |group|
          ['first_name', 'last_name', 'facebook', 'twitter', 'linkedin'].each do |field|
            fill_in "#{form}_#{group}_attributes_0_#{field}", :with => team.send(group).first.send(field)
          end
        end
      end
      screenshot_and_save_page if $do_screenshots
      click_button 'Save changes'
    end

    def fill_in_company_market_form
      cmf = FactoryGirl.create(:company_market_form)
      'company_market_form'.tap do |form|
        fill_in "#{form}_product_media_url", :with => cmf.product_media_url
        fill_in_ckeditor "#{form}_market_info", cmf.market_info
        fill_in_ckeditor "#{form}_competitive_landscape", cmf.competitive_landscape
      end
      screenshot_and_save_page if $do_screenshots
      click_button 'Save changes'
    end
  end
end
