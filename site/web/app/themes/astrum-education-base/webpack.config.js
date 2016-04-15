var BowerWebpackPlugin = require("bower-webpack-plugin");
module.exports = {
  module: {
      loaders: [
          { test: /\.coffee$/, loader: "coffee-loader" },
          { test: /\.(coffee\.md|litcoffee)$/, loader: "coffee-loader?literate" }
      ]
  },
  resolve: {
    extensions: ["", ".js", ".coffee"]
  },
  plugins: [new BowerWebpackPlugin()]
}
