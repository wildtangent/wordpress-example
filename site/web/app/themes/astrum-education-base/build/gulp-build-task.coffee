# ### Build
# `gulp build` - Run all the build tasks but don't clean up beforehand.
# Generally you should be running `gulp` instead of `gulp build`.
runSequence = require('run-sequence')

gulpBuildTask = (callback) ->
  runSequence 'styles', 'scripts', [
    'fonts'
    'images'
  ], callback
  return

module.exports = gulpBuildTask
