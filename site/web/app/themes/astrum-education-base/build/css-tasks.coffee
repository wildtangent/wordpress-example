# ## Reusable Pipelines
# See https://github.com/OverZealous/lazypipe
lazypipe = require('lazypipe')
gulpif = require('gulp-if')
sass = require('gulp-sass')
less = require('gulp-less')
concat = require('gulp-concat')
autoprefixer = require('gulp-autoprefixer')
cssNano = require('gulp-cssnano')
sourcemaps = require('gulp-sourcemaps')
plumber = require('gulp-plumber')
rev = require('gulp-rev')
webpack = require('webpack-stream')
webpackConfig = require('../webpack.config')
enabled = require('./options')

# ### CSS processing pipeline
# Example
# ```
# gulp.src(cssFiles)
#   .pipe(cssTasks('main.css')
#   .pipe(gulp.dest(path.dist + 'styles'))
# ```
cssTasks = (filename) ->
  lazypipe().pipe(->
    gulpif !enabled.failStyleTask, plumber()
  ).pipe(->
    gulpif enabled.maps, sourcemaps.init()
  ).pipe(->
    gulpif '*.less', less()
  ).pipe(->
    gulpif '*.scss', sass(
      outputStyle: 'nested'
      precision: 10
      includePaths: [ '.' ]
      errLogToConsole: !enabled.failStyleTask)
  ).pipe(concat, filename).pipe(autoprefixer, browsers: [
    'last 2 versions'
    'android 4'
    'opera 12'
  ]).pipe(cssNano, safe: true).pipe(->
    gulpif enabled.rev, rev()
  ).pipe(->
    gulpif enabled.maps, sourcemaps.write('.', sourceRoot: 'assets/styles/')
  )()

module.exports = cssTasks
