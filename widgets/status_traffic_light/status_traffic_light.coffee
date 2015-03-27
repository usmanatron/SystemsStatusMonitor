class Dashing.StatusTrafficLight extends Dashing.Widget 

  @accessor 'title', ->
    switch @get('rag')
      when "r" then "CRITICAL"
      when "a" then "WARNING"
      when "g" then ""
      else "[Unknown error level]"

  constructor: ->
    super
 
  onData: (data) ->
    node = $(@node)        
    backgroundClass = "level-#{data.rag}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
