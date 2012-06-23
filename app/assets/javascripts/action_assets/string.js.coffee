String::constantize = () ->
  if @.match /[A-Z][A-z]*/
    eval("var that = #{@}")
    that
  else
    undefined

String::camelize = ->
    @replace /(?:^|[-_])(\w)/g, (_, c) ->
      (if c then c.toUpperCase() else '')
