$(document).ready(function() {
  /*
  $(this).scrollTop(0);
  
  var durationNext = 3000;
  var durationPrev = 500;
  var currentPhase = 0;
  var totalSections = $('a.trigger').length;
  
  var navigateNext = function () {
    if (currentPhase < totalSections - 1 && !$('body').hasClass('scrolling')) {
      phase[currentPhase].exit();
      currentPhase += 1;
      phase[currentPhase].init();
      $('body').addClass('scrolling');
      $(window).scrollTo($('a#trigger' + currentPhase), {
        duration: durationNext,
        easing: 'easeOutQuart',
        offset: -topViewportOffset,
        onAfter: function () {
          $('body').removeClass('scrolling');
          phase[currentPhase].start();
        }
      });
    }
  }
  var navigatePrev = function () {
    if (currentPhase > 0 && !$('body').hasClass('scrolling')) {
      phase[currentPhase].init();
      currentPhase -= 1;
      phase[currentPhase].init();
      $('body').addClass('scrolling');
      $(window).scrollTo($('a#trigger' + currentPhase), {
        duration: durationPrev,
        easing: 'easeOutQuart',
        offset: -topViewportOffset,
        onAfter: function () {
          $('body').removeClass('scrolling');
          phase[currentPhase].start();
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
  $('.navigation a.next').click(function (e) {
    e.preventDefault();
    navigateNext();
  });
  $('.navigation a.prev').click(function (e) {
    e.preventDefault();
    navigatePrev();
  });
  $('.navigation a.bullet').click(function (e) {
    e.preventDefault();
    currentPhase = $(this).attr("rel") - 1;
    if (currentPhase == -1) {
      currentPhase = 1;
      navigatePrev();
    } else {
      navigateNext();
    }
  });*/
});