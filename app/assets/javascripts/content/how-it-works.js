$(document).ready(function() {
  if($('.how-it-works-body').length) { 
    $('.how-it-works-body').imagesLoaded(function() {
      setTimeout(function() {
        window.toggleLoader(function() {
          setTimeout(function() {
            $(window).scrollTop(0);  
          }, 100);
          
          $(window).scrollTop(0);
          $('.how-it-works-pages').addClass('ready');
        });
        
        $(window).scrollTop(0);
      }, 300);
    });
     
    var durationNext = 2000;
    var durationPrev = 1000;
    var currentPhase = 0;
    var totalSections = $('a.trigger').length;
    
    var navigateNext = function () {
      if (currentPhase < totalSections - 1 && !$('body').hasClass('scrolling')) {
        currentPhase += 1;
        $('body').addClass('scrolling');
        $('.how-it-works-pages .nav-pages.show').removeClass('show');
        $('.how-it-works-pages .nav-steps.show').removeClass('show');
        $(window).scrollTo($('a#trigger' + currentPhase), {
          duration: durationNext,
          easing: 'easeInOutQuint',
          onAfter: function () {
            $('body').removeClass('scrolling');
            $('a#trigger' + currentPhase).parents('.page-content').find('.nav-pages').addClass('show');
            $('a#trigger' + currentPhase).parents('.page-content').find('.nav-steps').addClass('show');
          }
        });
      }
    }
    var navigatePrev = function () {
      if (currentPhase > 0 && !$('body').hasClass('scrolling')) {
        currentPhase -= 1;
        $('body').addClass('scrolling');
        $('.how-it-works-pages .nav-pages.show').removeClass('show');
        $('.how-it-works-pages .nav-steps.show').removeClass('show');
        $(window).scrollTo($('a#trigger' + currentPhase), {
          duration: durationPrev,
          easing: 'easeInOutQuint',
          onAfter: function () {
            $('body').removeClass('scrolling');
            $('a#trigger' + currentPhase).parents('.page-content').find('.nav-pages').addClass('show');
            $('a#trigger' + currentPhase).parents('.page-content').find('.nav-steps').addClass('show');
          }
        });
      }
    }
    
    
    $(window).mousewheel(function (event, delta) {
      event.preventDefault();
      if (delta <= -1) {
        navigateNext();
      } else if (delta >= 1) {
        navigatePrev();
      }
    });
    
    $(document).keydown(function (e) {
      if (e.keyCode == 40 || e.keyCode == 39) {
        navigateNext();
        e.preventDefault();
      } else if (e.keyCode == 38 || e.keyCode == 37) {
        navigatePrev();
        e.preventDefault();
      }
      if (e.keyCode == 33) {
        currentPhase = 1;
        navigatePrev();
        e.preventDefault();
      } else if (e.keyCode == 34) {
        currentPhase = 4;
        navigateNext();
        e.preventDefault();
      }
    });
    
    $('.how-it-works-pages .nav-pages a.next').click(function (e) {
      e.preventDefault();
      navigateNext();
    });
    
    $('.how-it-works-pages .nav-pages a.prev').click(function (e) {
      e.preventDefault();
      navigatePrev();
    });
    
    $('.how-it-works-pages .nav-pages a.bullet').click(function (e) {
      e.preventDefault();
      currentPhase = $(this).attr("rel") - 1;
      if (currentPhase == -1) {
        currentPhase = 1;
        navigatePrev();
      } else {
        navigateNext();
      }
    });
  }
});