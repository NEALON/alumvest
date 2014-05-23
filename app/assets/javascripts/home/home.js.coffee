# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#playVideo = ->
	#$('.container-bg').hide()
	#$('#video-trailer').css 'background-color', '#000000'
	#$('.video-wrapper').show()
	#$f('vimeo_player').api 'play'

#jQuery ->
	#$('.video-play').bind 'click', (event) ->
		#playVideo()
		#false

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
        backfaceVideo[0].pause();
    
  parent.toggleClass "active"

$(document).ready ->
  $("body").on "click", "#video-home .backface-video, #video-home .close-video", (event) ->
    event.preventDefault()
    toggleVideo()
    
