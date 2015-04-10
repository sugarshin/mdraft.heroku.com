_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ModelBase } = require '../base'

module.exports =
class Note extends ModelBase
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
