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
enabled = require('./enabled')

jsTasks = (filename) ->
  lazypipe()
    .pipe(->
      gulpif(enabled.maps, sourcemaps.init())
    ).pipe(webpack, webpackConfig)
     .pipe(concat, filename)
     .pipe(uglify, compress: 'drop_debugger': enabled.stripJSDebug)
     .pipe(->
        gulpif enabled.rev, rev()
      ).pipe(->
        gulpif enabled.maps, sourcemaps.write('.', sourceRoot: 'assets/scripts/')
      )()

module.exports = jsTasks

