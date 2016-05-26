# ### Fonts
# `gulp fonts` - Grabs all the fonts and outputs them in a flattened directory
# structure. See: https://github.com/armed/gulp-flatten
gulp = require('gulp')
flatten = require('gulp-flatten')
enabled = require('./enabled')
browserSync = enabled.browserSync

manifest = require('asset-builder')('./assets/manifest.json')
path = manifest.paths
globs = manifest.globs

gulpFontsTask = ->
  gulp.src(globs.fonts)
      .pipe(flatten())
      .pipe(gulp.dest(path.dist + 'fonts'))
      .pipe(browserSync.stream())

module.exports = gulpFontsTask
