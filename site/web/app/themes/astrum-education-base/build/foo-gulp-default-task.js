// ### Gulp
// `gulp` - Run a complete build. To compile for production run `gulp --production`.
var gulp = require('gulp')

var gulpDefaultTask = function() {
  gulp.start('build');
}

module.exports = gulpDefaultTask
