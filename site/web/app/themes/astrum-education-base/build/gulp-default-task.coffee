# ### Gulp
# `gulp` - Run a complete build. To compile for production run `gulp --production`.
gulp = require('gulp')

gulpDefaultTask = ->
  gulp.start 'build'
  return

module.exports = gulpDefaultTask
