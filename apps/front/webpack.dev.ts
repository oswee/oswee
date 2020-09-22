import { BazelResolverPlugin, IBazelWebpackOptions } from 'oswee/tools/webpack'
import * as webpack from 'webpack'
import * as path from 'path'
import * as HtmlWebpackPlugin from 'html-webpack-plugin'
import * as fs from 'fs'

module.exports = (env: any, argv: IBazelWebpackOptions) => ({
  mode: argv.mode,
  entry: [argv.entry],
  output: {
    path: path.dirname(path.resolve(argv.output)),
    filename: path.basename(argv.output),
  },
  optimization: {
    minimize: argv.mode === 'production',
  },
  watchOptions: {
    ignored: [/node_modules/],
  },
  stats: {
    warnings: true,
  },
  devtool: 'source-map',
  devServer: {
    port: 3000,
    open: false,
    historyApiFallback: true, // Serves index file for any path
    hot: true, // https://github.com/webpack/webpack-dev-server/issues/97#issuecomment-69726201
    compress: true,
    allowedHosts: ['dev.oswee.com'], // Disabling this and the disableHostCheck leads to Invalid Host header by HAProxy
    http2: true,
    https: {
      key: fs.readFileSync('/home/dzintars/.tls/oswee.com/privkey.pem'),
      cert: fs.readFileSync('/home/dzintars/.tls/oswee.com/fullchain.pem'),
      ca: fs.readFileSync('/home/dzintars/.tls/oswee.com/fullchain.pem'),
    },
    overlay: {
      warnings: true,
      errors: true,
    },
    // TODO: Use devServer.transportMode wss
    sockHost: 'dev.oswee.com',
    sockPath: '/sockjs-node',
    sockPort: 443,
    publicPath: '/',
    contentBase: path.resolve('./apps/front/src'),
    stats: {
      colors: true,
    },
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'apps/front/src/template.html',
      favicon: 'apps/front/src/assets/favicon.ico',
      filename: './index.html',
    }),
    new webpack.HotModuleReplacementPlugin({
      // Options...
    }),
  ],
  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.jsx', '.json', '.css'],
    // This makes sure we can resolve modules in bazel, but only works in runfiles.
    // TODO: Copy rollup_bundle node_modules linking example so we can remove this.
    plugins: [new BazelResolverPlugin()],
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: [
          { loader: require.resolve('style-loader') },
          {
            loader: require.resolve('css-loader'),
            query: {
              modules: true,
            },
          },
        ],
      },
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: [{ loader: require.resolve('umd-compat-loader') }],
      },
    ],
  },
})
