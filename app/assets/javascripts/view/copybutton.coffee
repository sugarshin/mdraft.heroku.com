_ = require 'underscore'
$ = require 'jquery'
Backbone = require 'backbone'
ZeroClipboard = require 'zeroclipboard'
Backbone.$ = $

class CopyButton extends Backbone.View
  initialize: ->
    @client = new ZeroClipboard( document.getElementById('copy-button') )
    @client.on 'beforecopy', (ev) =>
      text = $('#textarea').val()
      @$el.attr 'data-clipboard-text', text

module.exports = CopyButton
