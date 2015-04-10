_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ViewBase } = require '../base'
NoteBody = require './notebody'
Markdown = require './markdown'

module.exports =
class NoteView extends ViewBase
  tagName: 'li'

  # constructor: ({@model, @el, @$el}) ->

  initialize: ->
    @model.on 'destroy', @remove, @
    @model.on 'change:active', @toggleActive, @
    @toggleActive()

  events:
    'click': 'onClick'
    'click .title': 'onTitleClick'
    'blur .title-editor': 'onTitleEdited'
    'change .checkbox': 'onChangeCheckbox'

  render: ->
    attrs = @model.toJSON()

    html = "<input type='checkbox' class='checkbox'>
            <span class='title'>
              #{attrs.title}
            </span>
            <input type='text' class='title-editor'>
            <span class='created'>
              #{attrs.created}
            </span>"

    @$el.html html
    return this

  toggleActive: ->
    @$el.toggleClass 'ac', @model.get 'active'

  onClick: (ev) ->
    clsName = ev.target.className
    if clsName is 'title' or clsName is 'checkbox' then return

    @model.collection.each (model) ->
      model.deactivate()

    @model.activate()

    if $('#textarea').length
      $('#textarea').remove()

    new NoteBody({model: @model})


    $('#textarea')
      .focus()
      .val @model.get 'body'

    md = new Markdown(
      document.getElementById 'preview'
      document.getElementById 'textarea'
    )

    md.toHTML().start()

    $('.js-title-bind').text @model.get('title')
    $('.js-time-bind').text @model.get('created')

  onTitleEdited: ->
    val = @$('.title-editor').val().trim()

    if val is ''
      @$('.title').show()
    else
      @model.set('title', val)
      @$('.title').text(val).show()

      if @model.get('active') is true
        $('.js-title-bind').text @model.get('title')

    @$('.title-editor').hide()


  onTitleClick: ->
    @$('.title').hide()
    @$('.title-editor').show().focus()

  onChangeCheckbox: (ev) ->
    @model.set('checked', @$el.find('.checkbox').prop('checked'))
