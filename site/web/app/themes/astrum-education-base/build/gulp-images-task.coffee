# ### Images
# `gulp images` - Run lossless compression on all the images.
gulp = require('gulp')
imagemin = require('gulp-imagemin')
enabled = require('./enabled')

browserSync = enabled.browserSync
manifest = enabled.manifest
path = enabled.path
globs = enabled.globs

gulpImagesTask = ->
  gulp.src(globs.images).pipe(imagemin(
    progressive: true
    interlaced: true
    svgoPlugins: [
      { removeUnknownsAndDefaults: false }
      { cleanupIDs: false }
    ])).pipe(gulp.dest(path.dist + 'images')).pipe browserSync.stream()

module.exports = gulpImagesTask
