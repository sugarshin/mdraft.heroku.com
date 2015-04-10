_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ViewBase } = require '../base'

module.exports =
class NewButton extends ViewBase
  events:
    'click': 'newNote'

  newNote: ->
    @collection.add {}
