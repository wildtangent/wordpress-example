# ### Write to rev manifest
# If there are any revved files then write them to the rev manifest.
# See https://github.com/sindresorhus/gulp-rev
gulp = require('gulp')
rev = require('gulp-rev')
lazypipe = require('lazypipe')
options = require('./options')

browserSync = options.browserSync
manifest = options.manifest
path = options.path
revManifest = options.revManifest

writeToManifest = (directory) ->
  lazypipe()
    .pipe(gulp.dest, path.dist + directory)
    .pipe(browserSync.stream, match: '**/*.{js,css}')
    .pipe(rev.manifest, revManifest,
      base: path.dist
      merge: true
    ).pipe(gulp.dest, path.dist)()

module.exports = writeToManifest
