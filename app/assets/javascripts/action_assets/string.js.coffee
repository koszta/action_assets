String::constantize = () ->
  if @.match /[A-Z][A-z]*/
    eval("var that = #{@}")
    that
  else
    undefined

String::camelize = ->
  @replace /(?:^|[-_/])(\w)/g, (s, c) ->
    if c
      if s.indexOf('/') == 0
          ".prototype.#{c.toUpperCase()}"
        else
          c.toUpperCase()
    else
      ''
