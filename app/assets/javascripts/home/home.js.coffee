# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


toggleVolume = ->
  babsonVideo = $("#babson-video video")
  
  if babsonVideo.length
    if Object::toString.call(babsonVideo[0].play) is "[object Function]"       
      babsonVideo[0].muted = !babsonVideo[0].muted
      
  
toggleVideo = ->
  body = $("body")
  babsonVideo = $("#babson-video video")
  
  if body.hasClass("active")
    $f('vimeo_player').api 'pause'
    $f('vimeo_player').api 'seekTo', 0 
    
    if babsonVideo.length
      if Object::toString.call(babsonVideo[0].play) is "[object Function]"       
        babsonVideo[0].play()
  else
    $f('vimeo_player').api 'play' 
    
    if babsonVideo.length
      if Object::toString.call(babsonVideo[0].pause) is "[object Function]"
        babsonVideo[0].pause()
    
  body.toggleClass "active"
  
window['endBabsonVideo'] = ->
  babsonVideo = $("#babson-video video")
  
  if babsonVideo.length
    if Object::toString.call(babsonVideo[0].play) is "[object Function]"
      babsonVideo[0].play()
      babsonVideo[0].loop = true

$(document).ready ->
  $("#home-video").on "hide.bs.modal", (e) ->
    toggleVideo()
  
  $("#home-video").on "show.bs.modal", (e) ->
    toggleVideo()
    
  $("body").on "click", '#babson-video .toggle-volume', (e) ->
    e.preventDefault()
    
    $(this).toggleClass 'active'
    toggleVolume()
    