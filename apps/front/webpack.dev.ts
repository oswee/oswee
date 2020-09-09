import webpack from 'webpack'
import common from './webpack.common'
import path from 'path'
import fs from 'fs'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import merge from 'webpack-merge'

const config: webpack.Configuration = merge(common, {
  mode: 'development',
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
    publicPath: '/',
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/template.html',
      // template: path.resolve(__dirname, 'src', 'template.html'),
      favicon: './src/assets/favicon.ico',
      filename: './index.html',
    }),
    new webpack.HotModuleReplacementPlugin({
      // Options...
    }),
  ],
  devtool: 'source-map',
  devServer: {
    // https://webpack.js.org/configuration/dev-server/
    host: '0.0.0.0',
    port: 3000, // Can omit this, so port will be picked up randomly from available ports.
    // open: true, // Open in default browser tab automatically
    historyApiFallback: true, // Serves index file for any path
    hot: true, // https://github.com/webpack/webpack-dev-server/issues/97#issuecomment-69726201
    compress: true,
    // https://webpack.js.org/configuration/dev-server/#devserverhttp2
    allowedHosts: ['dev.oswee.com'], // Disabling this and the disableHostCheck leads to Invalid Host header by HAProxy
    http2: true,
    https: {
      key: fs.readFileSync('/home/dzintars/.tls/oswee.com/privkey.pem'),
      cert: fs.readFileSync('/home/dzintars/.tls/oswee.com/fullchain.pem'),
      ca: fs.readFileSync('/home/dzintars/.tls/oswee.com/fullchain.pem'),
    },
    // To run behind HAProxy (insecure) https://stackoverflow.com/a/43647767/6651080
    // disableHostCheck: true, // Probably not needed if allowedHosts is used
    overlay: {
      warnings: true,
      errors: true,
    },
    // TODO: Use devServer.transportMode wss
    sockHost: 'dev.oswee.com',
    sockPath: '/sockjs-node',
    sockPort: 443,
  },
  module: {
    rules: [
      {
        test: /\.css|\.s(c|a)ss$/,
        exclude: /node_modules/,
        use: [
          // Order of the loaders are important!
          { loader: 'style-loader' }, // 3. Inject styles into DOM
          { loader: 'css-loader', options: { modules: false, url: false } }, // 2. Turns CSS into commonjs (CSS Modules - it has some issues when On)
          { loader: 'sass-loader' }, // 1. Turns SCSS into CSS
        ],
        // include: /src/,
        // use: [
        //   { loader: 'style-loader' }, // 3. Inject styles into DOM
        //   { loader: 'lit-scss-loader', options: { minify: false /* defaults to false */ } },
        //   { loader: 'css-modules-typescript-loader' }, // to generate a .d.ts module next to the .scss file
        //   { loader: 'extract-loader' },
        //   { loader: 'css-loader', options: { modules: false } }, // 2. to convert the resulting CSS to Javascript to be bundled (modules:true to rename CSS classes in output to cryptic identifiers, except if wrapped in a :global(...) pseudo class)
        //   { loader: 'sass-loader', options: { sourceMap: true } }, // 1. Turns SCSS into CSS
        // ],
      },
      {
        test: /\.(svg|png|jpe?g|gif)$/,
        use: {
          loader: 'file-loader',
          options: {
            outputPath: '/img',
            name: '[name].[contenthash].[ext]',
          },
        },
      },
    ],
  },
})

export default config
