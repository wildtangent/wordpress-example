UTIL = require './util'
Logger = require 'js-logger'

class App
  constructor: ->
    Logger.useDefaults()
    $(document).ready UTIL.loadEvents
    console.log("App has loaded")

module.exports = App
