class Dashing.Motd extends Dashing.Widget 

  @accessor 'message', ->
    @get 'displayMessage'

  @accessor 'origin', ->
    @get 'displayOrigin'

  constructor: ->
    super

  onData: (data) ->
    currentOrigin = @get 'displayOrigin'
    newMessage =  data.message
    newOrigin =  data.origin

    if currentOrigin isnt "manual"
      # Overwrite in all cases
      @updateDisplay(newMessage, newOrigin)
    else
      if newOrigin is "auto"
        # Don't overwrite display however store for later
        @set 'autoMessage', newMessage
      else
        if newMessage is ""
          # Empty new manual message => fallback to last auto message
          autoMessage = @get 'autoMessage'
          @updateDisplay(autoMessage, 'auto')
        else
          # Update manual message
          @updateDisplay(newMessage, newOrigin)


  updateDisplay: (message,origin) ->
    node = $(@node)
    @set 'displayMessage', message
    @set 'displayOrigin', origin

    backgroundClass = "message-#{origin}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
