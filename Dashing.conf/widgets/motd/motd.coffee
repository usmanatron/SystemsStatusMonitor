class Dashing.Motd extends Dashing.Widget 

  @accessor 'message', ->
    currentMessage = @get 'currentMessage'
    currentMessageOrigin = @get 'currentMessageOrigin'
    newMessage =  @get 'newMessage'
    newMessageOrigin =  @get 'newMessageOrigin'

    if currentMessageOrigin is "auto"
       newMessage
    else
      if newMessageOrigin is "auto" and currentMessage isnt ""
        currentMessage
      else
        newMessage

  @accessor 'origin', ->
    currentMessage = @get 'currentMessage'
    currentMessageOrigin = @get 'currentMessageOrigin'
    newMessage =  @get 'newMessage'
    newMessageOrigin =  @get 'newMessageOrigin'

    if currentMessageOrigin is "auto"
       newMessageOrigin
    else
      if newMessageOrigin is "auto" and currentMessage isnt ""
        currentMessageOrigin
      else
        newMessageOrigin

  constructor: ->
    super
 
  onData: (data) ->
    node = $(@node)        
    
    currentMessage = @get 'message'
    currentMessageOrigin = @get 'origin'

    @set "currentMessage", currentMessage
    @set "currentMessageOrigin", currentMessageOrigin
    @set "newMessage", data.message
    @set "newMessageOrigin", data.origin
   
    backgroundClass = "message-#{currentMessageOrigin}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
