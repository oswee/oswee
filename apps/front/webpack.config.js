const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const fs = require('fs');

module.exports = {
  mode: 'development',
  context: __dirname,
  entry: {
    main: './src/index.ts',
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
    publicPath: '/',
  },
  module: {
    rules: [
      {
        test: /\.html$/,
        use: ['html-loader'],
      },
      {
        test: /\.ts?$/,
        loader: require.resolve('ts-loader'),
      },
      {
        enforce: 'pre',
        test: /\.js$/,
        loader: 'source-map-loader',
      }, {
        test: /\.css|\.s(c|a)ss$/,
        use: [
          // Order of the loaders are important!
          {loader: 'style-loader'}, // 3. Inject styles into DOM
          {loader: 'css-loader', options: {modules: false, url: false}}, // 2. Turns CSS into commonjs (CSS Modules - it has some issues when On)
          {loader: 'sass-loader'}, // 1. Turns SCSS into CSS
        ],
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      filename: './index.html',
      template: './src/index.html',
    }),
    // new HotModuleReplacementPlugin({
    // Options...
    // }),
  ],
  resolve: {
    extensions: ['.ts', '.js', '.json', 'css', '.scss'],
  },
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
};
