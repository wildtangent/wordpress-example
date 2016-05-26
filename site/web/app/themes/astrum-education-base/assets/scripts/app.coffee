UTIL = require './util'
Logger = require 'js-logger'

class App
  constructor: ->
    Logger.useDefaults();
    $(document).ready UTIL.loadEvents

module.exports = App
