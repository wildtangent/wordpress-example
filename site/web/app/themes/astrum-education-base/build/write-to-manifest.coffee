# ### Write to rev manifest
# If there are any revved files then write them to the rev manifest.
# See https://github.com/sindresorhus/gulp-rev
gulp = require('gulp')
rev = require('gulp-rev')
lazypipe = require('lazypipe')
enabled = require('./enabled')
browserSync = enabled.browserSync

manifest = require('asset-builder')('./assets/manifest.json')
path = manifest.paths
revManifest = path.dist + 'assets.json'

writeToManifest = (directory) ->
  lazypipe()
    .pipe(gulp.dest, path.dist + directory)
    .pipe(browserSync.stream, match: '**/*.{js,css}')
    .pipe(rev.manifest, revManifest,
      base: path.dist
      merge: true
    ).pipe(gulp.dest, path.dist)()

module.exports = writeToManifest
