argv = require('minimist')(process.argv.slice(2))
browserSync = require('browser-sync').create()

module.exports =
  rev: argv.production
  maps: !argv.production
  failStyleTask: argv.production
  failJSHint: argv.production
  stripJSDebug: argv.production
  browserSync: browserSync
