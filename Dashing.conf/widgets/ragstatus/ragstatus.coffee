class Dashing.Ragstatus extends Dashing.Widget 

  @accessor 'title', ->
    switch @get('rag')
      when "r" then "CRITICAL"
      when "a" then "WARNING"
      when "g" then ""
      else "[Unknown error level]"


  constructor: ->
    super

  ready: ->
    rag = @get('rag')
    @setBackground(rag)
 
  onData: (data) ->
    rag = data.rag
    @setBackground(rag)

  setBackground: (rag) ->
    node = $(@node)
    backgroundClass = "level-#{rag}"
    lastClass = @get "lastClass"

    node.toggleClass "#{lastClass} #{backgroundClass}"
    @set "lastClass", backgroundClass
