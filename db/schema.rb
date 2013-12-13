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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131213161120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancbox_accounts", force: true do |t|
    t.string   "status"
    t.integer  "banking_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bancbox_bank_accounts", force: true do |t|
    t.string   "bank_account_number"
    t.string   "bank_account_type"
    t.string   "bank_account_holder"
    t.string   "bank_account_routing"
    t.integer  "bancbox_investor_id"
    t.integer  "bancbox_issuer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bancbox_id"
    t.string   "reference_id"
  end

  add_index "bancbox_bank_accounts", ["bancbox_investor_id"], name: "index_bancbox_bank_accounts_on_bancbox_investor_id", using: :btree
  add_index "bancbox_bank_accounts", ["bancbox_issuer_id"], name: "index_bancbox_bank_accounts_on_bancbox_issuer_id", using: :btree

  create_table "bancbox_escrows", force: true do |t|
    t.string   "name"
    t.string   "reference_id"
    t.string   "bancbox_id"
    t.date     "start_date"
    t.date     "close_date"
    t.float    "funding_goal"
    t.float    "minimum_funding_amount"
    t.string   "securities_offered"
    t.string   "securities_offered_other"
    t.float    "over_funding_amount"
    t.float    "maximum_funding_amount"
    t.float    "current_balance"
    t.float    "total_funding"
    t.string   "status"
    t.string   "issuer_signatory_email"
    t.string   "issuer_signatory_name"
    t.string   "issuer_signatory_title"
    t.string   "disbursement_status"
    t.string   "disbursal_started"
    t.integer  "bancbox_issuer_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bancbox_status",           default: "unsubmitted"
  end

  create_table "bancbox_fund_transactions", force: true do |t|
    t.integer  "trans_id"
    t.string   "status"
    t.boolean  "trans_status"
    t.integer  "amount"
    t.string   "memo"
    t.text     "text"
    t.integer  "bancbox_bank_account_id"
    t.integer  "bancbox_investor_id"
    t.integer  "bancbox_issuer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bancbox_fund_transactions", ["bancbox_bank_account_id"], name: "index_bancbox_fund_transactions_on_bancbox_bank_account_id", using: :btree
  add_index "bancbox_fund_transactions", ["bancbox_investor_id"], name: "index_bancbox_fund_transactions_on_bancbox_investor_id", using: :btree
  add_index "bancbox_fund_transactions", ["bancbox_issuer_id"], name: "index_bancbox_fund_transactions_on_bancbox_issuer_id", using: :btree

  create_table "bancbox_identity_verifications", force: true do |t|
    t.string   "bancbox_status"
    t.boolean  "is_verified",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "banking_account_id"
    t.string   "status"
  end

  create_table "bancbox_investors", force: true do |t|
    t.string   "ssn"
    t.string   "investor_type"
    t.string   "email"
    t.string   "phone"
    t.string   "date_of_birth"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "bancbox_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "reference_id"
    t.string   "bancbox_id"
    t.string   "bank_name"
    t.string   "account_number"
    t.string   "account_routing_number"
    t.string   "account_type"
    t.boolean  "agreement"
    t.string   "middle_initial"
    t.integer  "funds",                  default: 0
    t.integer  "pendingbalance",         default: 0
    t.integer  "banking_account_id"
  end

  create_table "bancbox_issuers", force: true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "name"
    t.string   "ssn"
    t.string   "investor_type"
    t.string   "email"
    t.string   "phone"
    t.string   "date_of_birth"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "company_name"
    t.string   "company_type"
    t.string   "company_registration_state"
    t.string   "company_tax_id"
    t.string   "bancbox_status"
    t.string   "reference_id"
    t.string   "bancbox_id"
    t.string   "bank_name"
    t.string   "account_number"
    t.string   "account_routing_number"
    t.string   "account_type"
    t.boolean  "agreement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "funds",                      default: 0
    t.integer  "pendingbalance",             default: 0
    t.integer  "banking_account_id"
  end

  create_table "bancbox_transactions", force: true do |t|
    t.string   "type"
    t.decimal  "value"
    t.integer  "bancbox_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banking_accounts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "bus_events", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "signing_id"
    t.integer  "admin_id"
    t.integer  "campaign_id"
  end

  create_table "campaigns", force: true do |t|
    t.string   "status"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.string   "ownership_structure"
    t.string   "logo_url"
    t.string   "company_url"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.text     "company_highlights"
    t.integer  "category_id"
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "campaign_title"
    t.text     "company_details"
    t.string   "founded_on_year"
    t.string   "photo_url"
    t.string   "video_url"
    t.text     "faq"
    t.string   "short_description"
    t.string   "banner_photo_url"
    t.string   "aggregate_status"
    t.integer  "campaign_id"
  end

  create_table "contract_doc_groups", force: true do |t|
    t.string   "status"
    t.integer  "investment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "file_url"
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "signature_required", default: false
  end

  create_table "educations", force: true do |t|
    t.string   "school"
    t.string   "degree"
    t.integer  "user_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "envelope_events", force: true do |t|
    t.integer  "envelope_id"
    t.string   "status"
    t.datetime "status_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "envelopes", force: true do |t|
    t.integer  "template_id"
    t.string   "envelope_id"
    t.string   "email_subject"
    t.string   "uri"
    t.text     "email_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "signing_id"
  end

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["campaign_id"], name: "index_follows_on_campaign_id", using: :btree
  add_index "follows", ["user_id", "campaign_id"], name: "index_follows_on_user_id_and_campaign_id", unique: true, using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "funding_levels", force: true do |t|
    t.string   "status"
    t.integer  "amount"
    t.integer  "investment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "description",     default: "guest"
  end

  create_table "investment_terms", force: true do |t|
    t.string   "business_plan_url"
    t.string   "financial_statement_url"
    t.string   "term_sheet_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "fundraising_amount"
    t.integer  "campaign_length"
    t.string   "equity_type"
    t.string   "funds_retained"
    t.string   "fees_paid_by"
    t.text     "elevator_pitch"
    t.text     "investment_details"
    t.integer  "campaign_id"
    t.decimal  "min_investment"
    t.decimal  "max_investment"
  end

  create_table "investments", force: true do |t|
    t.string   "status"
    t.integer  "campaign_id"
    t.integer  "investor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investors", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investors", ["user_id"], name: "index_investors_on_user_id", using: :btree

  create_table "irs_doc_groups", force: true do |t|
    t.string   "status"
    t.integer  "investment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "contact"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "ssn"
    t.text     "financial_info"
    t.text     "experience"
    t.text     "expertise"
    t.string   "marital_status"
    t.text     "personal_message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["user_id"], name: "index_owners_on_user_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "populatable_id"
    t.string   "populatable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "avatar_url"
    t.string   "video_url"
    t.string   "title"
    t.text     "introduction"
  end

  create_table "questionnaires", force: true do |t|
    t.string   "status"
    t.string   "annual_income"
    t.string   "year_of_income"
    t.string   "income_type"
    t.string   "net_worth"
    t.integer  "investment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "signings", force: true do |t|
    t.string   "status",        default: "unsigned"
    t.integer  "investment_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_agreements", force: true do |t|
    t.string   "status"
    t.integer  "investment_finalization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.text     "team_highlights"
    t.integer  "campaign_id"
  end

  create_table "templates", force: true do |t|
    t.string   "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "document_id"
  end

  create_table "updates", force: true do |t|
    t.string   "subject"
    t.text     "details"
    t.string   "visibility"
    t.string   "video_url"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "user_type",          default: "guest"
    t.string   "avatar_url"
    t.string   "ssn"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.text     "personal_statement"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
