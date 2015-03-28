class Dashing.Motd extends Dashing.Widget 

  @accessor 'message', ->
    @get 'displayMessage'

  @accessor 'origin', ->
    @get 'displayOrigin'

  constructor: ->
    super

  ready: ->
    @set "displayMessage", ""
    @set "displayOrigin", "auto"

  onData: (data) ->
    node = $(@node)        
    
    currentMessage = @get 'message'
    currentOrigin = @get 'origin'
    newMessage =  data.message
    newOrigin =  data.origin

    if currentOrigin is "auto"
      @set "displayMessage", newMessage
      @set "displayOrigin", newOrigin
      backgroundClass = "message-#{newOrigin}"      
    else
      if newOrigin is "auto" and currentMessage isnt ""
        @set "displayMessage", currentMessage
        @set "displayOrigin", currentOrigin
        backgroundClass = "message-#{currentOrigin}"      

      else
        @set "displayMessage", newMessage
        @set "displayOrigin", newOrigin
        backgroundClass = "message-#{newOrigin}"      

    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
