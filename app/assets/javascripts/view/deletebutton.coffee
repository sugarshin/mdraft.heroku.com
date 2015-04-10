_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ViewBase } = require '../base'
NoteBody = require './notebody'
Markdown = require './markdown'

module.exports =
class DeleteButton extends ViewBase
  events:
    'click': 'onClick'

  onClick: ->
    checkedModel = @collection.filter (model, i, c) -> model.get('checked')
    unless checkedModel.length then return

    if confirm '削除しますか？'
      rmList = []
      @collection.each (model, i, collection) ->
        if model? and model.get('checked') is true
          rmList.push model.id

      for id in rmList
        @collection.remove id

      $('#textarea').remove()

      new NoteBody(
        collection: @collection
      )

      md = new Markdown(
        document.getElementById 'preview'
        document.getElementById 'textarea'
      )

      md.toHTML().start()
