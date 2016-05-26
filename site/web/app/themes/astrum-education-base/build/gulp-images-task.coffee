# ### Images
# `gulp images` - Run lossless compression on all the images.
gulp = require('gulp')
imagemin = require('gulp-imagemin')
options = require('./options')

browserSync = options.browserSync
manifest = options.manifest
path = options.path
globs = options.globs

gulpImagesTask = ->
  gulp.src(globs.images).pipe(imagemin(
    progressive: true
    interlaced: true
    svgoPlugins: [
      { removeUnknownsAndDefaults: false }
      { cleanupIDs: false }
    ])).pipe(gulp.dest(path.dist + 'images')).pipe browserSync.stream()

module.exports = gulpImagesTask
