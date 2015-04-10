_ = require 'underscore'
$ = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $

class Note extends Backbone.Model
  defaults: ->
    return {
      title: '無題'
      body: ''
      created: @getDate()
      checked: false
      active: false
    }

  initialize: ->
    @save()
    @on 'change:title change:body', (model, val) ->
      model.save()

  getDate: ->
    date = new Date
    y = date.getFullYear()
    m = date.getMonth()
    d = date.getDate()
    h = date.getHours()
    mi = date.getMinutes()
    return "#{y}/#{m + 1}/#{d} #{h}:#{mi}"

  activate: -> @set 'active', true

  deactivate: -> @set 'active', false

module.exports = Note
