$(document).ready ->
  rules =
    "bancbox_bank_account[bank_account_holder]":
      required: true
    "bancbox_bank_account[bank_account_type]":
      required: true
    "bancbox_bank_account[bank_account_routing]":
      required: true
      digits: true
    "bancbox_bank_account[bank_account_number]":
      required: true
      digits: true

  messages =
    "bancbox_bank_account[bank_account_holder]":
      required: "Please type in account holder's name."
    "bancbox_bank_account[bank_account_type]":
      required: "Please choose the type of your bank account."
    "bancbox_bank_account[bank_account_routing]":
      required: "Please type in your routing number."
      digits: "Please provide a valid routing number."
    "bancbox_bank_account[bank_account_number]":
      required: "Please type in your bank account number."
      digits: "Please provide a valid bank account number."

  $('#issuer_bank_account_form .btn.btn-success').click (event) ->
    $('#issuer_bank_account_form').validate({rules, messages})
