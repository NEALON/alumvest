module Features
  module FormHelpers
    def fill_in_ckeditor(item, value)
      page.driver.browser.execute_script("CKEDITOR.instances['#{item}'].setData('#{value}');")
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
      cbf = FactoryGirl.build(:company_basic_form)
      'company_basic_form'.tap do |form|
        fill_in "#{form}_name",
                :with => cbf.name
        # filepicker fill_in "#{form}_logo_url", :with => Faker::Internet.url
        select cbf.founded_on.year,
               :from => "#{form}_founded_on_1i"
        select Date::MONTHNAMES[cbf.founded_on.month],
               :from => "#{form}_founded_on_2i"
        select cbf.founded_on.day,
               :from => "#{form}_founded_on_3i"
        fill_in "#{form}_url",
                :with => cbf.url
        select cbf.ownership_structure,
               :from => "#{form}_ownership_structure"
        select cbf.category.name,
               :from => "#{form}_category_id"
        select cbf.industry.name,
               :from => "#{form}_industry_id"
        fill_in_ckeditor "#{form}_summary",
                         cbf.summary
        fill_in "#{form}_address_1",
                :with => cbf.address_1
        fill_in "#{form}_address_2",
                :with => cbf.address_2
        fill_in "#{form}_city",
                :with => cbf.city
        fill_in "#{form}_state",
                :with => cbf.state
        fill_in "#{form}_zip",
                :with => cbf.zip
        fill_in "#{form}_phone",
                :with => cbf.phone
      end
      click_button 'Save changes'
    end

    def fill_in_company_funding_doc_form
      cfdf = FactoryGirl.build(:company_funding_doc_form)
      'company_funding_doc_form'.tap do |form|
        # filepicker fill_in "#{form}_business_plan_url", cfdf.business_plan_url
        # filepicker fill_in "#{form}_tbd_financial_document_url", :with => cfdf.tbd_financial_document_url
        # filepicker fill_in "#{form}_tbd_funding_document_url", :with => cfdf.tbd_funding_document_url
        # filepicker fill_in "#{form}_tbd_detailed_metrics_document_url", :with => cfdf.tbd_detailed_metrics_document_url
        fill_in_ckeditor "#{form}_recent_investors", cfdf.recent_investors
        fill_in_ckeditor "#{form}_roadmap", cfdf.roadmap
        fill_in_ckeditor "#{form}_shareholder_message", cfdf.shareholder_message
      end
      click_button 'Save changes'
    end

    def fill_in_company_personnel_form
      cpf = FactoryGirl.build(:company_personnel_form)
      cpf.legal_counsel << FactoryGirl.create(:legal_counsel)
      cpf.founders << FactoryGirl.create(:founder)
      cpf.team_members << FactoryGirl.create(:team_member)
      cpf.board_members << FactoryGirl.create(:board_member)
      cpf.advisors << FactoryGirl.create(:advisor)

      'company_personnel_form'.tap do |form|
        'legal_counsel'.tap do |entity|
          fill_in "#{form}_#{entity}_attributes_0_first_name", :with => cpf.legal_counsel.first.first_name
          fill_in "#{form}_#{entity}_attributes_0_last_name", :with => cpf.legal_counsel.first.last_name
        end
        'founders'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => cpf.founders.first.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => cpf.founders.first.last_name
        end
        'team_members'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => cpf.team_members.first.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => cpf.team_members.first.last_name
        end
        'board_members'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => cpf.board_members.first.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => cpf.board_members.first.last_name
        end
        'advisors'.tap do |group|
          fill_in "#{form}_#{group}_attributes_0_first_name", :with => cpf.advisors.first.first_name
          fill_in "#{form}_#{group}_attributes_0_last_name", :with => cpf.advisors.first.last_name
        end
      end
      click_button 'Save changes'
    end

    def fill_in_company_market_form
      cmf = FactoryGirl.create(:company_market_form)
      'company_market_form'.tap do |form|
        fill_in "#{form}_product_media_url", :with => cmf.product_media_url
        fill_in_ckeditor "#{form}_market_info", cmf.market_info
        fill_in_ckeditor "#{form}_competitive_landscape", cmf.competitive_landscape
      end
      click_button 'Save changes'
    end
  end
end