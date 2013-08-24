class CombineCampaignAndCompany < ActiveRecord::Migration
  def change
    remove_column :campaigns, :title
    add_column :company_basic_forms, :title, :string

    remove_column :campaigns, :headline
    add_column :company_basic_forms, :headline, :string

    add_column :company_basic_forms, :company_introductions, :text

    remove_column :company_basic_forms, :founded_on
    add_column :company_basic_forms, :founded_on_year, :string

    remove_column :campaigns, :photo_url
    add_column :company_basic_forms, :photo_url, :string

    remove_column :campaigns, :video_url
    add_column :company_basic_forms, :video_url, :string

    remove_column :campaigns, :summary
    rename_column :company_basic_forms, :summary, :highlights

    remove_column :campaigns, :amount
    add_column :company_funding_doc_forms, :fundraising_amount, :integer
  end
end
