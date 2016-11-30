var utils = require('./utils')

module.exports = function (runtime, cb) {
  if (!runtime.ghPagesEnv.GHPAGES_URL) {
    return cb(new Error('GHPAGES_URL was not set. Did you source env.sh first?'))
  }

  for (var key in runtime.ghPagesEnv) {
    if (runtime.ghPagesEnv[key]) {
      utils.passthru(runtime, 'travis encrypt --skip-version-check --add env.global ' + key + '=$' + key, { cwd: process.cwd() })
    }
  }

  cb(null)
}