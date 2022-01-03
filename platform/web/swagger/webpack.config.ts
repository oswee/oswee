// import { BazelResolverPlugin, IBazelWebpackOptions } from '@oswee/tools/webpack'

import * as webpack from 'webpack'
import * as path from 'path'
import HtmlWebpackPlugin from 'html-webpack-plugin'
// import * as fs from 'fs'

// import webpack from 'webpack'
// import path from 'path'
// import HtmlWebpackPlugin from 'html-webpack-plugin'
// import fs from 'fs'

module.exports = (env: any, argv: any) => ({
  mode: argv.mode || 'development',
  target: 'es2020',
  entry: './index.ts',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].bundle.js',
    publicPath: '/',
  },
  optimization: {
    minimize: argv.mode === 'production',
  },
  watchOptions: {
    ignored: ['/node_modules/'],
  },
  stats: {
    warnings: true,
  },
  // node: {
  //   fs: 'empty',
  //   child_process: 'empty',
  // },
  devtool: 'source-map',
  devServer: {
    port: 3000,
    open: false,
    historyApiFallback: true, // Serves index file for any path
    hot: true, // https://github.com/webpack/webpack-dev-server/issues/97#issuecomment-69726201
    compress: true,
    allowedHosts: ['dev.oswee.com'], // Disabling this and the disableHostCheck leads to Invalid Host header by HAProxy
    overlay: {
      warnings: true,
      errors: true,
    },
    publicPath: '/',
    contentBase: path.resolve('./index'),
    stats: {
      colors: true,
    },
    after: (_: any, socket: any) => {
      // Listen to STDIN, which is written to by ibazel to tell it to reload.
      // Must check the message so we only bundle after a successful build completes.
      process.stdin.on('data', data => {
        if (!String(data).includes('IBAZEL_BUILD_COMPLETED SUCCESS')) {
          return
        }
        socket.sockWrite(socket.sockets, 'content-changed')
      })
    },
  },
  resolve: {
    extensions: ['.ts', '.js', '.json', '.css'],
    // This makes sure we can resolve modules in bazel, but only works in runfiles.
    // TODO: Copy rollup_bundle node_modules linking example so we can remove this.
    // plugins: [new BazelResolverPlugin()],
    alias: {
      '@oswee': path.resolve('/'),
    },
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './template.html',
      favicon: './favicon.ico',
      filename: './index.html',
    }),
    new webpack.HotModuleReplacementPlugin({
      // Options...
    }),
  ],
  module: {
    rules: [
      {
        test: /\.ts?$/,
        loader: require.resolve('ts-loader'),
        // options: PnpWebpackPlugin.tsLoaderOptions(),
        // options: PnpWebpackPlugin.tsLoaderOptions({ transpileOnly: true }),
      },
      {
        test: /\.css$/,
        exclude: ['/node_modules/'],
        use: [
          { loader: require.resolve('style-loader') },
          {
            loader: require.resolve('css-loader'),
          },
        ],
      },
    ],
  },
})
