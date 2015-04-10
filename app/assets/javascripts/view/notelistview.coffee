_ = require 'underscore'
$ = require 'jquery'
Backbone = require 'backbone'
Note = require './../model/note'
NoteView = require './noteview'

Backbone.$ = $

class NoteListView extends Backbone.View
  # constructor: ({@el, @$el, @collection}) ->

  initialize: ->
    @collection.on 'add fetch', @add, @
    @collection.on 'remove', @remove, @

  add: (model) ->
    _model = if model? then model else new Note()
    item = new NoteView(
      model: _model
      listView: @
    )
    @$el.append item.render().el

  remove: (model, collection, options) ->
    model.destroy()

module.exports = NoteListView
