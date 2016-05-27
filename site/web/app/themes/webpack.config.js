// Example webpack configuration with asset fingerprinting in production.
'use strict';

var path = require('path');
var webpack = require('webpack');
var StatsPlugin = require('stats-webpack-plugin');
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var ManifestPlugin = require('webpack-manifest-plugin');

// must match config.webpack.dev_server.port
var devServerPort = 3000;

// set TARGET=production on the environment to add asset fingerprints
var production = process.env.TARGET === 'production';

var config = {
  entry: {
    // Sources are expected to live in $app_root/dist
    'astrum-education-base/dist/scripts/main': [
      './astrum-education-base/assets/scripts/main.coffee'
    ],
    'astrum-education/dist/scripts/main': [,
      './astrum-education/assets/scripts/main.coffee'
    ]
  },

  output: {
    path: path.join(__dirname),
    publicPath: '/',
    filename: production ? '[name]-[chunkhash].js' : '[name].js'
  },

  resolve: {
    root: path.join(__dirname),
    extensions: ['', '.js', '.coffee'],
    modulesDirectories: [
      'node_modules',
      'bower_components'
    ]
  },

  coffeelint: {
    configFile: 'coffeelint.json'
  },

  module: {
    preLoaders: [
      { test: /\.coffee$/, loader: "coffee-lint-loader", exclude: /node_modules/ }
    ],

    loaders: [
      { test: /\.css$/, loader: ExtractTextPlugin.extract('style', 'css!postcss') },
      { test: /\.scss$/, loader: ExtractTextPlugin.extract('style', 'css!postcss!sass') },
      {
        test: /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "url?limit=10000"
      },
      {
        test: /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
        loader: 'file'
      },

      { test: /\.jade$/, loader: 'jade-loader' },

      { test: /\.coffee$/, loader: "coffee-loader"},
      { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" },

      // Bootstrap 4
      { test: /bootstrap\/dist\/js\/umd\//, loader: 'imports?jQuery=jquery' },

      // Bootstrap 3
      { test: /bootstrap-sass\/assets\/javascripts\//, loader: 'imports?jQuery=jquery' },
    ],
  },

  plugins: [
    // Don't need paths for bower components (allegedly)
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin(
        'bower.json', ['main']
      )
    ),
    // No need to require these in every file
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
      React: 'react',
      paper: 'paper'
    }),
    // must match config.webpack.manifest_filename
    new StatsPlugin('dist/manifest.json', {
      // We only need assetsByChunkName
      chunkModules: false,
      source: false,
      chunks: false,
      modules: false,
      assets: true
    }),
    new ManifestPlugin({
      fileName: 'dist/assets.json'
    })
  ],
};

if (production) {
  config.plugins.push(
    new ExtractTextPlugin('[name]-[chunkhash].css', { allChunks: true }),
    new webpack.NoErrorsPlugin(),
    new webpack.optimize.UglifyJsPlugin({
      compressor: { warnings: false },
      sourceMap: false
    }),
    new webpack.DefinePlugin({
      'process.env': { NODE_ENV: JSON.stringify('production') }
    }),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.OccurenceOrderPlugin()
  );
} else {
  config.plugins.push(
    new ExtractTextPlugin('[name].css', { allChunks: true })
  )

  config.devServer = {
    port: devServerPort,
    hot: true,
    headers: { 'Access-Control-Allow-Origin': '*' },
    proxy: {
      '*': {
        target: 'https://astrumeducation.dev',
        secure: false
      }
    }
  };
  config.output.publicPath = '//localhost:' + devServerPort + '/app/themes/';
  // Source maps
  config.devtool = 'cheap-module-eval-source-map';
}

module.exports = config;
