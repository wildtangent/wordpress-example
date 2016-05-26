# ### Images
# `gulp images` - Run lossless compression on all the images.
gulp = require('gulp')
imagemin = require('gulp-imagemin')
enabled = require('./enabled')
browserSync = enabled.browserSync

manifest = require('asset-builder')('./assets/manifest.json')
path = manifest.paths
globs = manifest.globs

gulpImagesTask = ->
  gulp.src(globs.images).pipe(imagemin(
    progressive: true
    interlaced: true
    svgoPlugins: [
      { removeUnknownsAndDefaults: false }
      { cleanupIDs: false }
    ])).pipe(gulp.dest(path.dist + 'images')).pipe browserSync.stream()

module.exports = gulpImagesTask
