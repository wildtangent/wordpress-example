# ### JSHint
# `gulp jshint` - Lints configuration JSON and project JS.
gulp = require('gulp')
gulpif = require('gulp-if')
jshint = require('gulp-jshint')
options = require('./options')

manifest = options.manifest
project = options.project

gulpJSHintTask = ->
  gulp.src([
    'bower.json'
    'gulpfile.js'
  ].concat(project.js))
   .pipe(jshint())
   .pipe(jshint.reporter('jshint-stylish'))
   .pipe(gulpif(options.failJSHint, jshint.reporter('fail')))

module.exports = gulpJSHintTask
