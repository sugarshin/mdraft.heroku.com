$ = require 'jquery'
td = require 'throttle-debounce'
marked = require 'marked'

class Markdown
  defaults = {}

  # _toHTML = -> @preview.innerHTML = markdown.toHTML @input.value
  _toHTML = -> @preview.innerHTML = marked @input.value

  constructor: (@preview, @input, options) ->
    @options = $.extend {}, defaults, options

  _addEventify: ->
    that = @
    @input.addEventListener 'input', (ev) ->
      that.debounceToHtml this, @preview
    , false
    return this

  toHTML: ->
    _toHTML.call @
    return this

  debounceToHtml: td.debounce 250, _toHTML

  start: ->
    @_addEventify()
    return this

module.exports = Markdown
