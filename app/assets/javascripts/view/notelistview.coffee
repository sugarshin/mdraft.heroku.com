_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ViewBase } = require '../base'
Note = require './../model/note'
NoteView = require './noteview'

module.exports =
class NoteListView extends ViewBase
  # constructor: ({@el, @$el, @collection}) ->

  initialize: ->
    @collection.on 'add fetch', @add, @
    @collection.on 'remove', @remove, @

  add: (model) ->
    _model = if model? then model else new Note()
    item = new NoteView
      model: _model
      listView: @

    @$el.append item.render().el

  remove: (model, collection, options) ->
    model.destroy()
