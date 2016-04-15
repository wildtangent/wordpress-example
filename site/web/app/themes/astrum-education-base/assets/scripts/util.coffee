Sage = require './sage'

# The routing fires all common scripts, followed by the page specific scripts.
# Add additional events for more control over timing e.g. a finalize event
UTIL =
  fire: (func, funcname, args) ->
    fire = undefined
    namespace = Sage
    funcname = if funcname == undefined then 'init' else funcname
    fire = func != ''
    fire = fire and namespace[func]
    fire = fire and typeof namespace[func][funcname] == 'function'
    if fire
      namespace[func][funcname] args
    return
  loadEvents: ->
    # Fire common init JS
    UTIL.fire 'common'
    # Fire page-specific init JS, and then finalize JS
    $.each document.body.className.replace(/-/g, '_').split(/\s+/), (i, classnm) ->
      UTIL.fire classnm
      UTIL.fire classnm, 'finalize'
      return
    # Fire common finalize JS
    UTIL.fire 'common', 'finalize'
    return

module.exports = UTIL
