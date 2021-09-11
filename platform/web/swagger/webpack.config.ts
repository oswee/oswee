import path from 'path'
import webpack from 'webpack'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import { CleanWebpackPlugin } from 'clean-webpack-plugin'
// import CopyWebpackPlugin from 'copy-webpack-plugin'

const outputPath = path.resolve(__dirname, 'dist')

const config: webpack.Configuration = {
  mode: 'development',
  entry: {
    app: require.resolve('./src/index'),
  },
  resolve: {
    extensions: ['.ts', '.js'],
  },
  module: {
    rules: [
      {
        test: /\.yaml$/,
        use: [{ loader: 'json-loader' }, { loader: 'yaml-loader' }],
      },
      {
        test: /\.css$/,
        use: [{ loader: 'style-loader' }, { loader: 'css-loader' }],
      },
    ],
  },
  plugins: [
    new CleanWebpackPlugin(),
    // new CopyWebpackPlugin(),
    // new CopyWebpackPlugin({
    //   patterns: [
    //     {
    //       // Copy the Swagger OAuth2 redirect file to the project root;
    //       // that file handles the OAuth2 redirect after authenticating the end-user.
    //       from: require.resolve('swagger-ui/dist/oauth2-redirect.html'),
    //       to: './',
    //     },
    //   ],
    // }),
    new HtmlWebpackPlugin({
      template: 'platform/web/swagger/index.html',
    }),
  ],
  output: {
    filename: '[name].bundle.js',
    path: outputPath,
  },
}

export default config
