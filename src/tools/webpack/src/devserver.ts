import webpackDevServer from 'webpack-dev-server'
import webpack from 'webpack'

import { getArgv, getConfig } from './index'

const argv = getArgv()
const config = getConfig(argv)

// There is a bug in dev-server with lazy mode, which this works around.
// https://github.com/webpack/webpack-dev-server/issues/1323;
const fixedConfig = { ...config, output: { ...config.output, path: '/' } }

const compiler = webpack(fixedConfig)

let running = false
const singleSimultaneousCompiler: webpack.Compiler = new Proxy(compiler, {
  get: (target: any, p: PropertyKey): any => {
    if (String(p) !== 'run') {
      return target[p]
    }
    // Wrap the run() function in some code that blocks until any previous run completes.
    return async callback => {
      while (running) {
        await new Promise(resolve => setTimeout(() => resolve(), 100))
      }
      running = true
      target[p]((err: Error, stats: webpack.Stats) => {
        running = false
        callback(err, stats)
      })
    }
  },
})

const devServerOptions: webpackDevServer.Configuration = {
  port: 3000,
  lazy: true,
  filename: config.output.filename,
  // This is called once, while the devserver starts.
  after: (app, server: any) => {
    // Listen to STDIN, which is written to by ibazel to tell it to reload
    // only after all dependent ts_library rules have finished compiling.
    process.stdin.on('data', () =>
      server.sockWrite(server.sockets, 'content-changed'),
    )
  },
  ...config.devServer,
}

const server = new webpackDevServer(
  singleSimultaneousCompiler,
  devServerOptions,
)

server.listen(devServerOptions.port, '127.0.0.1', () => {
  console.log(`Starting server on http://localhost:${devServerOptions.port}`)
  // Trigger an initial compilation immediately.
  singleSimultaneousCompiler.run(() => undefined)
})
