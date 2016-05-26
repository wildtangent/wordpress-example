var gulp            = require('gulp');
var merge           = require('merge-stream');
var manifest        = require('asset-builder')('./assets/manifest.json');
var writeToManifest = require('./write-to-manifest');
var enabled         = require('./enabled');
var cssTasks        = require('./css-tasks');

// ### Styles
// `gulp styles` - Compiles, combines, and optimizes Bower CSS and project CSS.
// By default this task will only log a warning if a precompiler error is
// raised. If the `--production` flag is set: this task will fail outright.
var gulpCssTask = function() {
  var merged = merge();
  manifest.forEachDependency('css', function(dep) {
    var cssTasksInstance = cssTasks(dep.name);
    if (!enabled.failStyleTask) {
      cssTasksInstance.on('error', function(err) {
        console.error(err.message);
        this.emit('end');
      });
    }
    merged.add(gulp.src(dep.globs, {base: 'styles'})
      .pipe(cssTasksInstance));
  });
  return merged
    .pipe(writeToManifest('styles'));
}

module.exports = gulpCssTask;
