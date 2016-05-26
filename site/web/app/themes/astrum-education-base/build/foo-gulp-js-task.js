// ### Scripts
// `gulp scripts` - Runs JSHint then compiles, combines, and optimizes Bower JS
// and project JS.
var gulp            = require('gulp');
var merge           = require('merge-stream');
var manifest        = require('asset-builder')('./assets/manifest.json');
var writeToManifest = require('./write-to-manifest');
var jsTasks        = require('./js-tasks');

var gulpJSTask = function() {
  var merged = merge();
  manifest.forEachDependency('js', function(dep) {
    merged.add(
      gulp.src(dep.globs, {base: 'scripts'})
        .pipe(jsTasks(dep.name))
    );
  });
  return merged
    .pipe(writeToManifest('scripts'));
}

module.exports = gulpJSTask
