window.toggleLoader = (callback) ->
  loader = $("#loader")
  loaderCorner = loader.find(".loader-corner")
  loaderBackdrop = loader.find(".loader-backdrop")
  loaderText = loader.find(".loader-text")
  
  $("body").toggleClass "loader-open"
  
  if loader.hasClass("in")
    loaderCorner.toggleClass "loading"
    loaderText.toggleClass "in"
    
    setTimeout (->
      loaderBackdrop.toggleClass "in"
      
      setTimeout (->
        loader.toggleClass "in"
        
        callback.call();
      ), 300
    ), 300
  else
    loader.toggleClass "in"
  
    setTimeout (->
      loaderBackdrop.toggleClass "in"
      
      setTimeout (->
        loaderCorner.toggleClass "loading"
        loaderText.toggleClass "in"
        
        callback.call();
      ), 300
    ), 1