# ### Wiredep
# `gulp wiredep` - Automatically inject Less and Sass Bower dependencies. See
# https://github.com/taptapship/wiredep
gulp = require('gulp')
changed = require('gulp-changed')
options = require('./options')

manifest = options.manifest
path = options.path
project = options.project

gulpWiredepTask = ->
  wiredep = require('wiredep').stream
  gulp.src(project.css)
      .pipe(wiredep())
      .pipe(changed(path.source + 'styles', hasChanged: changed.compareSha1Digest))
      .pipe gulp.dest(path.source + 'styles')

module.exports = gulpWiredepTask
