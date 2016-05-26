# ### Fonts
# `gulp fonts` - Grabs all the fonts and outputs them in a flattened directory
# structure. See: https://github.com/armed/gulp-flatten
gulp = require('gulp')
flatten = require('gulp-flatten')
options = require('./options')

browserSync = options.browserSync
manifest = options.manifest
path = options.path
globs = options.globs

gulpFontsTask = ->
  gulp.src(globs.fonts)
      .pipe(flatten())
      .pipe(gulp.dest(path.dist + 'fonts'))
      .pipe(browserSync.stream())

module.exports = gulpFontsTask
