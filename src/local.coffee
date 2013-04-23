# UMD
((root, factory) ->
  if typeof exports is 'object'
    module.exports = factory require 'Spine'
  else if typeof define is 'function' and define.amd
    define ['Spine'], factory
  else
    factory root.Spine
) this, (Spine) ->


  Spine.Model.Local =
    extended: ->
      @change @saveLocal
      @fetch @loadLocal

    saveLocal: ->
      result = JSON.stringify(@)
      localStorage[@className] = result

    loadLocal: ->
      result = localStorage[@className]
      @refresh(result or [], clear: true)

  Spine.Model.Local
