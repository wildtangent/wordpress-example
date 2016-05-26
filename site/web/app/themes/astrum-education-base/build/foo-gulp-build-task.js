// ### Build
// `gulp build` - Run all the build tasks but don't clean up beforehand.
// Generally you should be running `gulp` instead of `gulp build`.

var runSequence  = require('run-sequence');

var gulpBuildTask = function(callback) {
  runSequence('styles',
              'scripts',
              ['fonts', 'images'],
              callback);
}

module.exports = gulpBuildTask;
