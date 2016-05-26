// ## Reusable Pipelines
// See https://github.com/OverZealous/lazypipe
var lazypipe      = require('lazypipe');
var gulpif        = require('gulp-if');
var sass          = require('gulp-sass');
var less          = require('gulp-less');
var concat        = require('gulp-concat');
var autoprefixer  = require('gulp-autoprefixer');
var cssNano       = require('gulp-cssnano');
var sourcemaps    = require('gulp-sourcemaps');
var plumber       = require('gulp-plumber');
var rev           = require('gulp-rev');
var webpack       = require('webpack-stream');
var webpackConfig = require('../webpack.config');
var enabled       = require('./enabled');

// ### CSS processing pipeline
// Example
// ```
// gulp.src(cssFiles)
//   .pipe(cssTasks('main.css')
//   .pipe(gulp.dest(path.dist + 'styles'))
// ```
var cssTasks = function(filename) {
  return lazypipe()
    .pipe(function() {
      return gulpif(!enabled.failStyleTask, plumber());
    })
    .pipe(function() {
      return gulpif(enabled.maps, sourcemaps.init());
    })
    .pipe(function() {
      return gulpif('*.less', less());
    })
    .pipe(function() {
      return gulpif('*.scss', sass({
        outputStyle: 'nested', // libsass doesn't support expanded yet
        precision: 10,
        includePaths: ['.'],
        errLogToConsole: !enabled.failStyleTask
      }));
    })
    .pipe(concat, filename)
    .pipe(autoprefixer, {
      browsers: [
        'last 2 versions',
        'android 4',
        'opera 12'
      ]
    })
    .pipe(cssNano, {
      safe: true
    })
    .pipe(function() {
      return gulpif(enabled.rev, rev());
    })
    .pipe(function() {
      return gulpif(enabled.maps, sourcemaps.write('.', {
        sourceRoot: 'assets/styles/'
      }));
    })();
};

module.exports = cssTasks;
