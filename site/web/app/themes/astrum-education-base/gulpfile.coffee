# ## Globals
gulp = require('gulp')
# ## Task Definitions

gulpCssTask = require('./build/gulp-css-task')
gulpJSTask = require('./build/gulp-js-task')
gulpJSHintTask = require('./build/gulp-jshint-task')
gulpFontsTask = require('./build/gulp-fonts-task')
gulpImagesTask = require('./build/gulp-images-task')
gulpCleanTask = require('./build/gulp-clean-task')
gulpWatchTask = require('./build/gulp-watch-task')
gulpBuildTask = require('./build/gulp-build-task')
gulpWiredepTask = require('./build/gulp-wiredep-task')
gulpDefaultTask = require('./build/gulp-default-task')

# ## Gulp tasks
# Run `gulp -T` for a task summary
gulp.task 'styles', ['wiredep'], gulpCssTask
gulp.task 'scripts', ['jshint'], gulpJSTask
gulp.task 'fonts', gulpFontsTask
gulp.task 'images', gulpImagesTask
gulp.task 'jshint', gulpJSHintTask
gulp.task 'clean', gulpCleanTask
gulp.task 'watch', gulpWatchTask
gulp.task 'build', gulpBuildTask
gulp.task 'wiredep', gulpWiredepTask
gulp.task 'default', ['clean'], gulpDefaultTask
