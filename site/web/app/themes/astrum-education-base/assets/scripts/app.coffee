UTIL = require './util'

class App

  constructor: ->
    $(document).ready UTIL.loadEvents

module.exports = App
