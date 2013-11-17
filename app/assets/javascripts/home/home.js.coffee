# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

playVideo = ->
	$('.container-bg').hide()
	$('#video-trailer').css 'background-color', '#000000'
	$('.video-wrapper').show()
	$f('vimeo_player').api 'play'

jQuery ->
	$('.video-play').bind 'click', (event) ->
		playVideo()
		false
