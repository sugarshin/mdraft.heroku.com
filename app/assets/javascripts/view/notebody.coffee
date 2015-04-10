_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ViewBase } = require '../base'

module.exports =
class NoteBody extends ViewBase
  initialize: ->
    html = '<textarea class="textarea" id="textarea"></textarea>'

    $('#textareaWrapper').append html
    @$el = $('#textarea')

  events:
    'input': 'onChange'

  onChange: ->
    text = @$el.val()
    if @model?
      @model.set 'body', text
    else
      @collection.add(
        active: true
      )
      @model = @collection.at(@collection.length - 1)
      $('.js-title-bind').text @model.get('title')
      $('.js-time-bind').text @model.get('created')
