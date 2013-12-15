## This is for parallax scrolling in compaign page
$ ->
  $('.vertical-spacer-1-em').onePageNav
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
        $('.vertical-spacer-1-em').addClass('nav-fixed')
        # $('#company-nav-container').removeClass('container')
        # $('#company-nav-container').addClass('nav-fixed')
        # $('#company-nav').addClass('container')
      else
        $('.vertical-spacer-1-em').removeClass('nav-fixed')
        # $('#company-nav-container').removeClass('nav-fixed')
        # $('#company-nav-container').addClass('container')
        # $('#company-nav').removeClass('container')

  $(window).load () ->
    window.navTop = $('.vertical-spacer-1-em').offset().top - parseFloat($('.vertical-spacer-1-em').css('margin-top').replace(/auto/, 0))
