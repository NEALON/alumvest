$ ->
  $("[data-behaviour~=datepicker]").datepicker
    altFormat: "yyyy-mm-dd"
    format: "yyyy-mm-dd"
    altField: $(this).next()
    autoclose: true