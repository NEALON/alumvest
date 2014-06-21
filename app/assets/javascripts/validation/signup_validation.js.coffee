$(document).ready () ->
  rules =
    first_name:
      required: true
    last_name:
      required: true
    email:
      required: true
      email: true
    password:
      required: true
      minlength: 8
    password_confirmation:
      required: true
      equalTo: '#password'
    description:
      required: true

  messages =
    first_name:
      required: "Please enter first name"
    last_name:
      required: "Please enter last name"
    email:
      required: "Please enter email"
    password:
      required: "Please enter password."
      minlength: "Password should be at least 8 characters long."
    password_confirmation:
      required: "Please confirm the password."
      equalTo: "Please enter the same password again."
    description:
      required: "Please choose user type."
  
  $('#signup_form').validate({rules, messages})
