# ### Clean
# `gulp clean` - Deletes the build folder entirely.
gulp = require('gulp')
manifest = require('asset-builder')('./assets/manifest.json')
path = manifest.paths

module.exports = require('del').bind(null, [ path.dist ])
