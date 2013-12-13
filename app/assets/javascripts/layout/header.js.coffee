jQuery ->
  $('#user-name').bind 'click', (event) ->
    if $('.dropdown-menu').is(':visible')
      $('.dropdown-menu').hide()
      $(@).css('background-color','rgba(0, 0, 0, 0)')
    else
      $(@).css('background-color', 'rgba(255, 255, 255, 0.4)')
      $('.dropdown-menu').show()

    event.stopPropagation()

  # close dropdown when click on outside area
  $('html').bind 'click', (event) ->
    $('.dropdown-menu').hide()
    $(@).css('background-color','rgba(0, 0, 0, 0)')
