$(document).ready () ->
  rules =
    "alumvest_user_base[first_name]":
      required: true
    "alumvest_user_base[last_name]":
      required: true
    "alumvest_user_base[mobile_phone]":
      required: true
    "alumvest_user_base[email]":
      required: true
      email: true
    "alumvest_user_base[address_1]":
      required: true
    "alumvest_user_base[city]":
      required: true
    "alumvest_user_base[state]":
      required: true
    "alumvest_user_base[zipcode]":
      required: true
      digits: true

  messages =
    "alumvest_user_base[first_name]":
      required: "Please enter first name."
    "alumvest_user_base[last_name]":
      required: "Please enter last name."
    "alumvest_user_base[mobile_phone]":
      required: "Please enter your mobile phone."
    "alumvest_user_base[email]":
      required: "Please enter email"
    "alumvest_user_base[address_1]":
      required: "Please enter your address."
    "alumvest_user_base[city]":
      required: "Please enter the city you live in."
    "alumvest_user_base[state]":
      required: "Please enter the state you live in."
    "alumvest_user_base[zipcode]":
      required: "Please enter zip code."
      digits: "Please enter a valid zip code."

  $('#user_basic_information_form .btn.btn-success').click (event) ->
    $('#user_basic_information_form').validate({rules, messages})
