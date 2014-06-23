// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require underscore
//= require jquery
//= require jquery_ujs
//= require jquery.mousewheel
//= require jquery.easing
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require autoNumeric
//= require filepicker_async
//= require ckeditor-jquery
//= require cocoon
//= require bootstrap
//= require bootstrap-datepicker
//= require imagesloaded
//= require_tree .

$.validator.setDefaults({
  highlight: function(element) {
    $(element).closest('.form-group').addClass('has-error');
  },
  unhighlight: function(element) {
    $(element).closest('.form-group').removeClass('has-error');
  },
  errorElement: 'p',
  errorClass: 'help-block small',
  errorPlacement: function(error, element) {
    if(element.parent('.input-group').length || element.parent('.boolean').length) {
      error.insertAfter(element.parent());
    } 
    else {
      error.insertAfter(element);
    }
  }
});

$(document).ready(function() {
  // Init Tooltips
  $('[data-toggle="tooltip"]').tooltip();
  
  // Init Knob (Progressbar for company items)
  $('[data-toggle="knob"]').knob();
});
