# ### Clean
# `gulp clean` - Deletes the build folder entirely.
gulp = require('gulp')
enabled = require('./enabled')
path = enabled.path

module.exports = require('del').bind(null, [ path.dist ])
