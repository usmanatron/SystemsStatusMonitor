class Dashing.StatusTrafficLight extends Dashing.Widget

  constructor: ->
    super
 
  onData: (data) ->
    node = $(@node)
    rag = data.rag
    
    title = switch
      when rag = "r" then "CRITICAL"
      when rag = "a" then "WARNING"
      when rag = "g" then ""
      else "[unrecognised error level]"
	
    backgroundClass = "rag_#{rag}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
