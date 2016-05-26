var lazypipe      = require('lazypipe');
var gulpif        = require('gulp-if');
var concat        = require('gulp-concat');
var uglify        = require('gulp-uglify');
var rev           = require('gulp-rev');
var sourcemaps    = require('gulp-sourcemaps');
var webpack       = require('webpack-stream');
var webpackConfig = require('../webpack.config');
var enabled       = require('./enabled');

// ### JS processing pipeline
// Example
// ```
// gulp.src(jsFiles)
//   .pipe(jsTasks('main.js')
//   .pipe(gulp.dest(path.dist + 'scripts'))
// ```
var jsTasks = function(filename) {
  return lazypipe()
    .pipe(function() {
      return gulpif(enabled.maps, sourcemaps.init());
    })
    .pipe(webpack, webpackConfig)
    .pipe(concat, filename)
    .pipe(uglify, {
      compress: {
        'drop_debugger': enabled.stripJSDebug
      }
    })
    .pipe(function() {
      return gulpif(enabled.rev, rev());
    })
    .pipe(function() {
      return gulpif(enabled.maps, sourcemaps.write('.', {
        sourceRoot: 'assets/scripts/'
      }));
    })();
};

module.exports = jsTasks;
