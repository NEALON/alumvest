$(document).ready () ->
  rules =
    auth_key:
      required: true
      email: true
    password:
      required: true

  messages =
    auth_key:
      required: "Please enter email."
    password:
      required: "Please enter password."
  
  $('#login_form').validate({rules, messages})
