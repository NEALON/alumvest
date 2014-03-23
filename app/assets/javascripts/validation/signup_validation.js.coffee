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
      minlength: 8
      equalTo: '#password'
    description:
      required: true

  messages =
    email:
      required: "Please enter email"
    password:
      required: "Please enter password"
    password_confirmation:
      equalTo: "Please enter the same password again."
    description:
      required: "Please choose user type."

  $('#signup_form #singlebutton').click (event) ->
    $('#signup_form').validate({rules, messages})
