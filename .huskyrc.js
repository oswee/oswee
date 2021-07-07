const tasks = arr => arr.join(' && ')

module.exports = {
  hooks: {
    'pre-commit': tasks(['yarn lint-staged']),
    'commit-msg': tasks(['yarn commitlint -E HUSKY_GIT_PARAMS']),
  },
}
