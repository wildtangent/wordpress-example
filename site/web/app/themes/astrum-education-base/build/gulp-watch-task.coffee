# ### Watch
# `gulp watch` - Use BrowserSync to proxy your dev server and synchronize code
# changes across devices. Specify the hostname of your dev server at
# `manifest.config.devUrl`. When a modification is made to an asset, run the
# build step for that asset and inject the changes into the page.
# See: http://www.browsersync.io
gulp = require('gulp')
gulpif = require('gulp-if')
jshint = require('gulp-jshint')
enabled = require('./enabled')

browserSync = enabled.browserSync
manifest = enabled.manifest
path = enabled.path
config = enabled.config

gulpWatchTask = ->
  browserSync.init
    files: [
      '{lib,templates}/**/*.php'
      '*.php'
      '{lib,templates}/**/*.twig'
      '*.twig'
    ]
    proxy: config.devUrl
    snippetOptions:
      whitelist: [ '/wp-admin/admin-ajax.php' ]
      blacklist: [ '/wp-admin/**' ]
  gulp.watch [ path.source + 'styles/**/*' ], [ 'styles' ]
  gulp.watch [ path.source + 'scripts/**/*' ], [
    'jshint'
    'scripts'
  ]
  gulp.watch [ path.source + 'fonts/**/*' ], [ 'fonts' ]
  gulp.watch [ path.source + 'images/**/*' ], [ 'images' ]
  gulp.watch [
    'bower.json'
    'assets/manifest.json'
  ], [ 'build' ]
  return

module.exports = gulpWatchTask
