# ### JS processing pipeline
# Example
# ```
# gulp.src(jsFiles)
#   .pipe(jsTasks('main.js')
#   .pipe(gulp.dest(path.dist + 'scripts'))
# ```
lazypipe = require('lazypipe')
gulpif = require('gulp-if')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
rev = require('gulp-rev')
sourcemaps = require('gulp-sourcemaps')
webpack = require('webpack-stream')
webpackConfig = require('../webpack.config')
options = require('./options')

jsTasks = (filename) ->
  lazypipe()
    .pipe(->
      gulpif(options.maps, sourcemaps.init())
    ).pipe(webpack, webpackConfig)
     .pipe(concat, filename)
     .pipe(uglify, compress: 'drop_debugger': options.stripJSDebug)
     .pipe(->
        gulpif options.rev, rev()
      ).pipe(->
        gulpif options.maps, sourcemaps.write('.', sourceRoot: 'assets/scripts/')
      )()

module.exports = jsTasks

