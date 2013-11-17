$ ->
  $(".invest-now").bind 'click', ->
    if $("#invest-now-alert").length == 0 # success
      investNowLink = $("#invest-url").val()
      window.location.href = investNowLink
    else
      $("#invest-now-alert").removeClass 'hide'

  $("#invest-now-btn").click (evt) ->
    evt.preventDefault()
