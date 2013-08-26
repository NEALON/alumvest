# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130825171413) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "ownership_structure"
    t.string   "logo_url"
    t.string   "url"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.text     "highlights"
    t.integer  "category_id"
    t.integer  "industry_id"
    t.integer  "company_worksheet_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "status"
    t.string   "title"
    t.string   "headline"
    t.text     "company_introductions"
    t.string   "founded_on_year"
    t.string   "photo_url"
    t.string   "video_url"
    t.string   "permalink"
    t.text     "pitch"
  end

  create_table "company_worksheets", :force => true do |t|
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "identities", :force => true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "last_name"
    t.string   "description",     :default => "guest"
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "investment_terms", :force => true do |t|
    t.string   "business_plan_url"
    t.string   "tbd_financial_document_url"
    t.string   "tbd_funding_document_url"
    t.string   "tbd_detailed_metrics_document_url"
    t.text     "recent_investors"
    t.text     "roadmap"
    t.text     "shareholder_message"
    t.integer  "company_worksheet_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "status"
    t.integer  "fundraising_amount"
    t.integer  "campaign_length"
    t.string   "equity_type"
    t.string   "funds_retained"
    t.text     "planned_fund_usage"
  end

  create_table "investors", :force => true do |t|
    t.string   "ssn"
    t.string   "marital_status"
    t.text     "financial_info"
    t.text     "spending_habits"
    t.string   "income"
    t.string   "income_type"
    t.string   "net_worth"
    t.string   "investor_representations"
    t.string   "industry"
    t.string   "company"
    t.string   "job_title"
    t.string   "experience"
    t.string   "expertise"
    t.string   "accredited_investor_status"
    t.text     "personal_message"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "investors", ["user_id"], :name => "index_investors_on_user_id"

  create_table "markets", :force => true do |t|
    t.string   "product_media_url"
    t.text     "market_info"
    t.text     "competitive_landscape"
    t.integer  "company_worksheet_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "status"
  end

  create_table "owners", :force => true do |t|
    t.string   "ssn"
    t.text     "financial_info"
    t.text     "experience"
    t.text     "expertise"
    t.string   "marital_status"
    t.text     "personal_message"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "owners", ["user_id"], :name => "index_owners_on_user_id"

  create_table "people", :force => true do |t|
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "populatable_id"
    t.string   "populatable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "avatar_url"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "teams", :force => true do |t|
    t.integer  "company_worksheet_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "status"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.text     "personal_statement"
    t.boolean  "profile_complete",   :default => false
    t.string   "user_type",          :default => "guest"
    t.string   "avatar_url"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
