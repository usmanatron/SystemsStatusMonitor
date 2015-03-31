class Dashing.Motd extends Dashing.Widget 
# The messages are stored in cookies to ensure they survive page refreshes (only
# the last event is replayed, which means that the manually added message can be lost).

  @accessor 'message', ->
    autoMessage = @get 'autoMessage'
    manualMessage = @get 'manualMessage'

    if manualMessage is "" or manualMessage is undefined
      @setBackground("auto")
      autoMessage
    else
      @setBackground("manual")
      manualMessage

  constructor: ->
    super

  ready: ->
    autoMessage = @getCookie('autoMessage')
    manualMessage = @getCookie('manualMessage')
    @set 'autoMessage', autoMessage
    @set 'manualMessage', manualMessage

  onData: (data) ->
    message = data.message
    if data.origin is "auto"
      @set 'autoMessage', message
      @setCookie('autoMessage', message)
    else
      @set 'manualMessage', message
      @setCookie('manualMessage', message)

  setBackground: (origin) ->
    node = $(@node)
    backgroundClass = "message-#{origin}"
    lastClass = @get "lastClass"
    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass

  setCookie: (name, value) ->
    document.cookie = name + "=" + value + "; path=/"

  getCookie: (name) ->
    nameEQ = name + "="
    ca = document.cookie.split(";")
    i = 0
    while i < ca.length
      c = ca[i]
      c = c.substring(1, c.length)  while c.charAt(0) is " "
      return c.substring(nameEQ.length, c.length)  if c.indexOf(nameEQ) is 0
      i++
    null
