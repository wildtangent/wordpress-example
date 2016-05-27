# Use this variable to set up the common and page specific functions. If you
# rename this variable, you will also need to rename the namespace below.
Logger = require 'js-logger'

Sage =
  'common':
    init: ->
      # JavaScript to be fired on all pages
      Logger.useDefaults()
      Logger.info("Sage has loaded from CoffeeScript")
      return

    finalize: ->
      # JavaScript to be fired on all pages, after page specific JS is fired
      return

  'home':
    init: ->
      # JavaScript to be fired on the home page
      return

    finalize: ->
      # JavaScript to be fired on the home page, after the init JS
      return

  'about_us':
    init: ->
      # JavaScript to be fired on the about us page
      return

  'style_guide':
    init: ->
      Logger.useDefaults()
      Logger.info("Style guide page JS loaded")

module.exports = Sage
