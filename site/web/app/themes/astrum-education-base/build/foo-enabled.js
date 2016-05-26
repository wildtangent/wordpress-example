var argv         = require('minimist')(process.argv.slice(2));
var browserSync  = require('browser-sync').create();

module.exports = {
  // Enable static asset revisioning when `--production`
  rev: argv.production,
  // Disable source maps when `--production`
  maps: !argv.production,
  // Fail styles task on error when `--production`
  failStyleTask: argv.production,
  // Fail due to JSHint warnings only when `--production`
  failJSHint: argv.production,
  // Strip debug statments from javascript when `--production`
  stripJSDebug: argv.production,

  // Make browserSync available to all who include this
  browserSync: browserSync
};
