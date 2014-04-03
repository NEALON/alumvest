$(document).ready ->
  rules =
    "alumvest_investor_base[ssn]":
      required: true
      digits: true
      minlength: 9
      maxlength: 9
    "alumvest_investor_base[marital_status]":
      required: true
    "alumvest_investor_base[financial_info]":
      required: true
    "alumvest_investor_base[spending_habits]":
      required: true
    "alumvest_investor_base[income]":
      required: true
    "alumvest_investor_base[income_type]":
      required: true
    "alumvest_investor_base[net_worth]":
      required: true
    "alumvest_investor_base[investor_representations]":
      required: true
    "alumvest_investor_base[company]":
      required: true
    "alumvest_investor_base[job_title]":
      required: true
    "alumvest_investor_base[experience]":
      required: true
    "alumvest_investor_base[expertise]":
      required: true

  messages =
    "alumvest_investor_base[ssn]":
      required: "Please type in SSN"
      digits: "SSN should be in digits."
      minlength: "SSN should be 9 digit long"
      maxlength: "SSN should be 9 digit long"
    "alumvest_investor_base[marital_status]":
      required: "Please type in your marital status."
    "alumvest_investor_base[financial_info]":
      required: "Please type in your financial information"
    "alumvest_investor_base[spending_habits]":
      required: "Please type in your spending habits"
    "alumvest_investor_base[income]":
      required: "Please type in your income"
    "alumvest_investor_base[income_type]":
      required: "Please type in your income type"
    "alumvest_investor_base[net_worth]":
      required: "Please type in your net worth"
    "alumvest_investor_base[investor_representations]":
      required: "Please type in your investor representation"
    "alumvest_investor_base[company]":
      required: "Please type in your company name"
    "alumvest_investor_base[job_title]":
      required: "Please type in your job title"
    "alumvest_investor_base[experience]":
      required: "Please type in your experience"
    "alumvest_investor_base[expertise]":
      required: "Please type in your expertise"

  $('#investor_profile_form .btn.btn-success').click (event) ->
    $('#investor_profile_form').validate({rules, messages})
