class Dashing.Motd extends Dashing.Widget 

  constructor: ->
    super
 
  onData: (data) ->
    node = $(@node)        
	
	
    backgroundClass = "level-#{data.rag}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
