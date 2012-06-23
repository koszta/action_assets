$.fn.actionAssetsTag = (selector = 'html', event, on_error = ->) ->
    $(selector).each ->
      params =
        controller: $(@).attr('data-controller')
    		  action: $(@).attr('data-action')
        layout: $(@).attr('data-layout')
        event: event
        selector: selector
  		  try
  			  "#{params.controller.camelize()}Script".constantize().prototype[params.action](params)
  		  catch error
  			  on_error(error)