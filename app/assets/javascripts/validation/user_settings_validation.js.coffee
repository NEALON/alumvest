$(document).ready () ->
  rules =
    "alumvest_user_base[password]":
      required: true
      minlength: 8
    "alumvest_user_base[password_confirmation]":
      required: true
      equalTo: '#alumvest_user_base_password'

  messages =
    "alumvest_user_base[password]":
      required: "Please enter password."
      minlength: "Password should be at least 8 characters long."
    "alumvest_user_base[password_confirmation]":
      required: "Please confirm password."
      equalTo: "Please enter the same password again."

  $('#user_settings_form').validate({rules, messages})
