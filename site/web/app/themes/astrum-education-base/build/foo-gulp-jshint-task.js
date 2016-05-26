// ### JSHint
// `gulp jshint` - Lints configuration JSON and project JS.

var gulp         = require('gulp');
var gulpif       = require('gulp-if');
var jshint       = require('gulp-jshint');
var manifest     = require('asset-builder')('./assets/manifest.json');
var enabled      = require('./enabled');

// `project` - paths to first-party assets.
// - `project.js` - Array of first-party JS assets.
// - `project.css` - Array of first-party CSS assets.
var project = manifest.getProjectGlobs();

var gulpJSHintTask = function() {
  return gulp.src([
    'bower.json', 'gulpfile.js'
  ].concat(project.js))
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish'))
    .pipe(gulpif(enabled.failJSHint, jshint.reporter('fail')));
}

module.exports = gulpJSHintTask
