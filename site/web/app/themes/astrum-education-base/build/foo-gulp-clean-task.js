// ### Clean
// `gulp clean` - Deletes the build folder entirely.
var gulp     = require('gulp')
var manifest = require('asset-builder')('./assets/manifest.json');
var path     = manifest.paths;

module.exports = require('del').bind(null, [path.dist])
