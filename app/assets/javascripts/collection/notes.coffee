_ = require 'lodash'
Backbone = require 'backbone'
Backbone.$ = $ = require 'jquery'
require 'backbone.localstorage'
{ CollectionBase } = require '../base'
Note = require './../model/note'

module.exports =
class Notes extends CollectionBase
  model: Note
  localStorage: new Backbone.LocalStorage 'mdraft'
