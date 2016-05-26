argv = require('minimist')(process.argv.slice(2))
browserSync = require('browser-sync').create()
manifest = require('asset-builder')('./assets/manifest.json')
path = manifest.paths
globs = manifest.globs
project = manifest.getProjectGlobs()
config = manifest.config or {}
revManifest = path.dist + 'assets.json'

module.exports =
  rev: argv.production
  maps: !argv.production
  failStyleTask: argv.production
  failJSHint: argv.production
  stripJSDebug: argv.production
  browserSync: browserSync
  manifest: manifest
  path: path
  globs: globs
  project: project
  config: config
  revManifest: revManifest
