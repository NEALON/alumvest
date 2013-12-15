## This is for parallax scrolling in compaign page
$ ->
  $('#company-nav').onePageNav
    currentClass: 'active'
    changeHash: false
    scrollSpeed: 750
    scrollOffset: 30
    scrollThreshold: 0.5
    filter: ''
    easing: 'swing'
    begin: () ->
      # I get fired when the animation is starting
    end: () ->
      # I get fired when the animation is ending
    scrollChange: (currentListItem) ->
      # I get fired when you enter a section and I pass the list item of the section

  $(window).scroll (event) ->
      y = $(@).scrollTop()
      if y >= window.navTop
        $('#header').hide()
        $('#company-nav-container').removeClass('container')
        $('#company-nav-container').addClass('nav-fixed')
        $('#company-nav').addClass('container')
      else
        $('#company-nav-container').removeClass('nav-fixed')
        $('#company-nav-container').addClass('container')
        $('#company-nav').removeClass('container')
        $('#header').show()

  $(window).load () ->
    window.navTop = $('#company-nav').offset().top - parseFloat($('#company-nav').css('margin-top').replace(/auto/, 0))
