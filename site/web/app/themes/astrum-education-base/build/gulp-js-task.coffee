# ### Scripts
# `gulp scripts` - Runs JSHint then compiles, combines, and optimizes Bower JS
# and project JS.
gulp = require('gulp')
merge = require('merge-stream')
enabled = require('./enabled')
writeToManifest = require('./write-to-manifest')
jsTasks = require('./js-tasks')

manifest = enabled.manifest

gulpJSTask = ->
  merged = merge()
  manifest.forEachDependency 'js', (dep) ->
    merged.add gulp.src(dep.globs, base: 'scripts').pipe(jsTasks(dep.name))
    return
  merged.pipe writeToManifest('scripts')

module.exports = gulpJSTask
