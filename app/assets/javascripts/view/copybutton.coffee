_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
ZeroClipboard = require 'zeroclipboard'
{ ViewBase } = require '../base'

module.exports =
class CopyButton extends ViewBase
  initialize: ->
    @client = new ZeroClipboard( document.getElementById('copy-button') )
    @client.on 'beforecopy', (ev) =>
      text = $('#textarea').val()
      @$el.attr 'data-clipboard-text', text
