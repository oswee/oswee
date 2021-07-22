import webpack from 'webpack'
import webpackDevServer from 'webpack-dev-server'
import yargs from 'yargs'

export class BazelResolverPlugin {
  public apply(resolver: any): any {
    resolver
      .getHook('resolve')
      .tapAsync(
        BazelResolverPlugin.name,
        (request: { request: string }, resolveContext: any, callback: any) => {
          const newRequest = { ...request }
          if (
            !request.request.startsWith('.') &&
            !request.request.startsWith('/')
          ) {
            // Use the bazel require.resolve functionality to work out the path for this import.
            try {
              newRequest.request = require.resolve(request.request)
            } catch (e) {
              // If bazel can't find it, it might still resolve normally.
            }
          }
          const target = resolver.ensureHook('parsedResolve')
          return resolver.doResolve(
            target,
            newRequest,
            null,
            resolveContext,
            callback,
          )
        },
      )
  }
}

export interface IBazelWebpackOptions {
  mode: 'development' | 'production'
  output: string
  entry: string
  port: string
}

export interface IBazelWebpackConfiguration extends webpack.Configuration {
  devServer?: webpackDevServer.Configuration
}

export function getArgv(): any {
  return yargs
    .option('mode', { type: 'string' })
    .option('devserver', { type: 'boolean' })
    .option('output', { type: 'string' })
    .option('entry', { type: 'string' })
    .option('port', { type: 'string' })
    .option('config', { type: 'string' }).argv
}

export function getConfig(argv: ReturnType<typeof getArgv>): any {
  const configRaw:
    | IBazelWebpackConfiguration
    | ((
        env: any,
        argv: IBazelWebpackOptions,
      ) => IBazelWebpackConfiguration) = require(argv.config)

  return typeof configRaw === 'function'
    ? configRaw({}, { ...argv, mode: (argv.mode as any) || 'development' })
    : configRaw
}
