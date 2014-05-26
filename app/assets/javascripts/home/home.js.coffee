# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


toggleVideo = ->
  parent = $("#video-home")
  backfaceVideo = parent.find(".backface-video video")
  
  if parent.hasClass("active")
    $f('vimeo_player').api 'pause'
    $f('vimeo_player').api 'seekTo', 0 
    
    if backfaceVideo.length
      if Object::toString.call(backfaceVideo[0].play) is "[object Function]"       
        backfaceVideo[0].play()
  else
    $f('vimeo_player').api 'play' 
    
    if backfaceVideo.length
      if Object::toString.call(backfaceVideo[0].pause) is "[object Function]"
        backfaceVideo[0].load()
        backfaceVideo[0].pause()
        backfaceVideo[0].muted = true
    
  parent.toggleClass "active"
  
window['endBackfaceVideo'] = ->
  backfaceVideo = $("#video-home .backface-video video")
  
  if backfaceVideo.length
    if Object::toString.call(backfaceVideo[0].play) is "[object Function]"
      backfaceVideo[0].play()
      backfaceVideo[0].muted = true
      backfaceVideo[0].loop = true

$(document).ready ->
  $("body").on "click", "#video-home .backface-video, #video-home .close-video", (event) ->
    event.preventDefault()
    toggleVideo()
    
