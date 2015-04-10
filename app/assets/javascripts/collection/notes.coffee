_ = require 'underscore'
$ = require 'jquery'
Backbone = require 'backbone'
Backbone.$ = $

Note = require './../model/note'
require 'backbone.localstorage'

class Notes extends Backbone.Collection
  model: Note
  localStorage: new Backbone.LocalStorage 'mdraft'

module.exports = Notes
