# ### Wiredep
# `gulp wiredep` - Automatically inject Less and Sass Bower dependencies. See
# https://github.com/taptapship/wiredep
gulp = require('gulp')
changed = require('gulp-changed')
manifest = require('asset-builder')('./assets/manifest.json')
path = manifest.paths
project = manifest.getProjectGlobs()

gulpWiredepTask = ->
  wiredep = require('wiredep').stream
  gulp.src(project.css)
      .pipe(wiredep())
      .pipe(changed(path.source + 'styles', hasChanged: changed.compareSha1Digest))
      .pipe gulp.dest(path.source + 'styles')

module.exports = gulpWiredepTask
