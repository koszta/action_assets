$.fn.actionAssetsTag = (event) ->
    @.each ->
      params =
        controller: $(@).attr('data-controller')
    		 action: $(@).attr('data-action')
        layout: $(@).attr('data-layout')
        event: event
        selector: @
  			 script = new ("#{params.controller.camelize()}Script".constantize())?(params)
  			 script?[params.action]?()