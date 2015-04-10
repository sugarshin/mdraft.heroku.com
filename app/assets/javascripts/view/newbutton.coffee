_ = require 'underscore'
$ = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $

class NewButton extends Backbone.View
  events:
    'click': 'newNote'

  newNote: ->
    @collection.add {}

module.exports = NewButton
