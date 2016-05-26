# ### Clean
# `gulp clean` - Deletes the build folder entirely.
gulp = require('gulp')
options = require('./options')
path = options.path

module.exports = require('del').bind(null, [ path.dist ])
