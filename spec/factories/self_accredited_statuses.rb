# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :self_accredited_status do
    financial_status ""
    term_startup_fail false
    term_responsible false
    term_av_permission false
    term_tos false
    investor nil
  end
end
