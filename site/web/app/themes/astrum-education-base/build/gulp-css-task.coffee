# ### Styles
# `gulp styles` - Compiles, combines, and optimizes Bower CSS and project CSS.
# By default this task will only log a warning if a precompiler error is
# raised. If the `--production` flag is set: this task will fail outright.
gulp = require('gulp')
merge = require('merge-stream')
writeToManifest = require('./write-to-manifest')
enabled = require('./enabled')
cssTasks = require('./css-tasks')

manifest = enabled.manifest

gulpCssTask = ->
  merged = merge()
  manifest.forEachDependency 'css', (dep) ->
    cssTasksInstance = cssTasks(dep.name)
    if !enabled.failStyleTask
      cssTasksInstance.on 'error', (err) ->
        console.error err.message
        @emit 'end'
        return
    merged.add gulp.src(dep.globs, base: 'styles').pipe(cssTasksInstance)
    return
  merged.pipe writeToManifest('styles')

module.exports = gulpCssTask
