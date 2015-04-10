_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
{ ViewBase } = require '../base'

module.exports =
class AppView extends ViewBase
  el: 'body'

  initialize: ->
    @$previewInner = $('.preview-inner')
    @$preview = $('#preview')
    @$tBtn = $('.t-btn')
    @$openBtn = $('#preview-open')

    @togglePreviewClass()

  events:
    'change .t-btn': 'togglePreviewClass'
    'click #preview-open': 'onPreivewOpenBtnClick'

  togglePreviewClass: ->
    @$preview.toggleClass 'tsumiki-blog-entry-body', @$tBtn.prop 'checked'
    @$previewInner.toggleClass 'tsumiki-blog-entry-head', @$tBtn.prop 'checked'

  onPreivewOpenBtnClick: ->
    @$previewInner.toggle()
