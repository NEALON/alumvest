$(document).ready ->
  $("#top-search-fr .btn").on "click", (e) ->
    parent = $("#top-search-fr")
    input = parent.find('.form-control')
    
    unless parent.hasClass("expanded")
      e.preventDefault()
      parent.addClass "expanded"
      input.focus()
