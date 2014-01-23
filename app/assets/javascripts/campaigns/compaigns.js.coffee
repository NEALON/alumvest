$ ->
  $(".invest-now").click (evt) ->
    evt.preventDefault()
    if $("#invest-now-alert").length == 0 # success
      investNowLink = $("#invest-url").val()
      window.location.href = investNowLink
    else
      $("#invest-now-alert").removeClass 'hide'
      return false

