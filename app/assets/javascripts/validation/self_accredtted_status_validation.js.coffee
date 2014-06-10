$(document).ready () ->
  rules =
    "alumvest_self_accredited_status[financial_status]":
      required: true
    "alumvest_self_accredited_status[term_startup_fail]":
      required: true
    "alumvest_self_accredited_status[term_responsible]":
      required: true
    "alumvest_self_accredited_status[term_av_permission]":
      required: true
    "alumvest_self_accredited_status[term_tos]":
      required: true

  messages =
    "alumvest_self_accredited_status[financial_status]":
      required: "You need to verify you financial status!"
    "alumvest_self_accredited_status[term_startup_fail]":
      required: "You need to agree on startup fail responsibility."
    "alumvest_self_accredited_status[term_responsible]":
      required: "You must agree it is your responsibility to do due diligence"
    "alumvest_self_accredited_status[term_av_permission]":
      required: "You must give permission to Alumvest to verify your accredited status."
    "alumvest_self_accredited_status[term_tos]":
      required: "You must agree to the Terms and Conditions."

  $('#self-accredited-status-form').validate({rules, messages})
