import webpack from 'webpack'
import common from './webpack.common'
import path from 'path'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import TerserPlugin from 'terser-webpack-plugin'
import OptimizeCssAssetsPlugin from 'optimize-css-assets-webpack-plugin'
import MiniCssExtractPlugin from 'mini-css-extract-plugin'
import merge from 'webpack-merge'
import { CleanWebpackPlugin } from 'clean-webpack-plugin'
//
const config: webpack.Configuration = merge(common, {
  mode: 'production',
  output: {
    filename: '[name].[contentHash].bundle.js',
    path: path.resolve(__dirname, 'dist'),
    publicPath: '/dist',
  },
  optimization: {
    minimizer: [new OptimizeCssAssetsPlugin(), new TerserPlugin()],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '[name].[contentHash].css',
    }),
    new CleanWebpackPlugin(),
    new HtmlWebpackPlugin({
      template: './src/template.html',
      minify: {
        removeAttributeQuotes: true,
        collapseWhitespace: true,
        removeComments: true,
      },
    }),
  ],
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          // Order of the loaders are important!
          MiniCssExtractPlugin.loader, // 3. Extract CSS into files
          'css-loader', // 2. Turns CSS into commonjs
          'sass-loader', // 1. Turns SCSS into CSS
        ],
      },
      {
        test: /\.(svg|png|jpe?g|gif)$/,
        use: {
          loader: 'file-loader',
          options: {
            name: '[name].[contenthash].[ext]',
            outputPath: '/img',
            publicPath: '/img',
          },
        },
      },
    ],
  },
})

export default config
