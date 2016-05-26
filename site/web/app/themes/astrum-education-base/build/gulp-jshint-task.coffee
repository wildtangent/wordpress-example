# ### JSHint
# `gulp jshint` - Lints configuration JSON and project JS.
gulp = require('gulp')
gulpif = require('gulp-if')
jshint = require('gulp-jshint')
enabled = require('./enabled')

manifest = enabled.manifest
project = enabled.project

gulpJSHintTask = ->
  gulp.src([
    'bower.json'
    'gulpfile.js'
  ].concat(project.js))
   .pipe(jshint())
   .pipe(jshint.reporter('jshint-stylish'))
   .pipe(gulpif(enabled.failJSHint, jshint.reporter('fail')))

module.exports = gulpJSHintTask
