$(document).ready () ->
  rules =
    "alumvest_user_base[first_name]":
      required: true
      maxlength: 45
      alphanumeric: true
    "alumvest_user_base[middle_name]":
      maxlength: 45
      alphanumeric: true
    "alumvest_user_base[last_name]":
      required: true
      maxlength: 45
      alphanumeric: true
    "alumvest_user_base[mobile_phone]":
      required: true
      minlength: 10
      maxlength: 10
      digits: true
    "alumvest_user_base[email]":
      required: true
      email: true
      maxlength: 45
    "alumvest_user_base[address_1]":
      required: true
      maxlength: 128
    "alumvest_user_base[address_2]":
      maxlength: 128
    "alumvest_user_base[city]":
      required: true
      maxlength: 45
      lettersonly: true
    "alumvest_user_base[state]":
      required: true
      maxlength: 45
      lettersonly: true
    "alumvest_user_base[zipcode]":
      required: true
      zipcodeUS: true

  messages =
    "alumvest_user_base[first_name]":
      required: "Please enter first name."
      maxlength: "Must be 45 characters or less."
      alphanumeric: "Must be letters and numbers only."

    "alumvest_user_base[middle_name]":
      maxlength: "Must be 45 characters or less."
      alphanumeric: "Must be letters and numbers only."

    "alumvest_user_base[last_name]":
      required: "Please enter last name."
      maxlength: "Must be 45 characters or less."
      alphanumeric: "Must be letters and numbers only."

    "alumvest_user_base[mobile_phone]":
      required: "Please enter your mobile phone."
      minlength: "Must be 10 digits."
      maxlength: "Must be 10 digits."
      digits: "May only contain digits."

    "alumvest_user_base[email]":
      required: "Please enter email"
      maxlength: "Must be 45 characters or less."
      email: "Must be a valid email address."

    "alumvest_user_base[address_1]":
      required: "Please enter your address."
      maxlength: "Must be 128 characters or less."

    "alumvest_user_base[address_2]":
      maxlength: "Must be 128 characters or less."

    "alumvest_user_base[city]":
      required: "Please enter the city you live in."
      maxlength: "Must be 45 characters or less."
      lettersonly: "May only contain letters."

    "alumvest_user_base[state]":
      required: "Please enter the state you live in."
      maxlength: "Must be 45 characters or less."
      lettersonly: "May only contain letters."

    "alumvest_user_base[zipcode]":
      required: "Please enter zip code."
      zipcodeUS: "Must be a valid US ZIP code"

  $('#user_basic_information_form .btn.btn-success').click (event) ->
    $('#user_basic_information_form').validate({rules, messages})
