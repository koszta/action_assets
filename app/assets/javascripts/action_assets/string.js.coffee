String::constantize = () ->
  if @.match /[A-Z][a-z]\.*/
    object = window
    $.each @.split('.'), ->
      object = object[@]
  else
    object = undefined
  object

String::camelize = ->
  @replace /(?:^|[-_/])(\w)/g, (s, c) ->
    if c
      if s.indexOf('/') == 0
          ".prototype.#{c.toUpperCase()}"
        else
          c.toUpperCase()
    else
      ''
