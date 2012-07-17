$.fn.actionAssetsTag = (event, on_error = ->) ->
    @.each ->
      params =
        controller: $(@).attr('data-controller')
    		  action: $(@).attr('data-action')
        layout: $(@).attr('data-layout')
        event: event
        selector: @
  		  try
  			  script = new ("#{params.controller.camelize()}Script".constantize())(params)
  			  script[params.action]()
  		  catch error
  			  on_error(error)