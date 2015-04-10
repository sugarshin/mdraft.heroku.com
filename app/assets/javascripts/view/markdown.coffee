_ = require 'lodash'
$ = require 'jquery'
marked = require 'marked'

module.exports =
class Markdown
  defaults = {}

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

  debounceToHtml: _.debounce _toHTML, 250

  start: ->
    @_addEventify()
    return this
