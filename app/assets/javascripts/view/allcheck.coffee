_ = require 'underscore'
$ = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $

class AllCheck extends Backbone.View
  events:
    'click': 'onClick'

  onClick: ->
    @checkedToggle()


  checkedAll: ->
    checkboxAll = $('.noteList').find('.checkbox')
    checkboxAll.prop 'checked', true

    @collection.each (model) ->
      model.set 'checked', true

  uncheckedAll: ->
    checkboxAll = $('.noteList').find('.checkbox')
    checkboxAll.prop 'checked', false

    @collection.each (model) ->
      model.set 'checked', false

  checkedToggle: ->
    checkboxAll = $('.noteList').find('.checkbox')
    checkboxAll.prop 'checked', !checkboxAll.prop('checked')

    @collection.each (model) ->
      model.set 'checked', !model.get('checked')

module.exports = AllCheck
