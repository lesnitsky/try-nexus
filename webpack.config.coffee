path = require 'path'

module.exports =
	cache: yes
	entry:
		app: './src/index.coffee'
	output:
		path: path.join __dirname, "dist"
		publicPath: 'dist/'
		filename: '[name].js'
		chunkFilename: '[chunkhash].js'
	module:
		loaders: [
			test: /\.coffee$/, loader: 'coffee'
		]
