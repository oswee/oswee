import * as webpack from 'webpack'

import { getArgv, getConfig } from 'oswee/tools/webpack'

const argv = getArgv()
const config = getConfig(argv)

const compiler = webpack(config)
let exitCode: 0 | 1 = 0
compiler.run((err, stats) => {
  if (err) {
    console.error(err.stack || err)
    if ((err as any).details) {
      console.error((err as any).details)
    }
    exitCode = 1
  }
  if (stats.hasErrors()) {
    const json = stats.toJson()
    json.errors.forEach(error => console.error(error))
    exitCode = 1
  }
})
process.exitCode = exitCode
