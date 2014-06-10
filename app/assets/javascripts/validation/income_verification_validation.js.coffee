$(document).ready ->
  rules =
    "veritax_order_base[first_name]":
      required: true
    "veritax_order_base[last_name]":
      required: true
    "veritax_order_base[ssn]":
      required: true
      digits: true
      minlength: 9
      maxlength: 9
    "veritax_order_base[email]":
      required: true
      email: true
    "veritax_order_base[address]":
      required: true
    "veritax_order_base[city]":
      required: true
    "veritax_order_base[state]":
      required: true
    "veritax_order_base[zip_code]":
      required: true

  messages =
    "veritax_order_base[first_name]":
      required: "Please type in you first name."
    "veritax_order_base[last_name]":
      required: "Please type in your last name."
    "veritax_order_base[ssn]":
      required: "Please type in SSN"
      digits: "SSN should be in digits."
      minlength: "SSN should be 9 digit long"
      maxlength: "SSN should be 9 digit long"
    "veritax_order_base[email]":
      required: "Please type in your email"
      email: "Please provide a valid email address"
    "veritax_order_base[address]":
      required: "Please type in your address."
    "veritax_order_base[city]":
      required: "Please type in your city."
    "veritax_order_base[state]":
      required: "Please type in the state."
    "veritax_order_base[zip_code]":
      required: "Please type in your zip code"
  
  $('#income_verification_form').validate({rules, messages})
