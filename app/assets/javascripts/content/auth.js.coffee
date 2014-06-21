$(document).ready ->
  # Toggle Signup
  $("#signup-modal").on "hide.bs.modal", (e) ->
    $('#signup-nav').toggleClass 'active'
    
  $("#signup-modal").on "show.bs.modal", (e) ->
    $('#signup-nav').toggleClass 'active'
    
  # Toggle Login
  $("#login-modal").on "hide.bs.modal", (e) ->
    $('#login-nav').toggleClass 'active'
    
  $("#login-modal").on "show.bs.modal", (e) ->
    $('#login-nav').toggleClass 'active'