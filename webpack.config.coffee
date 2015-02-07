path = require 'path'

module.exports =
	cache: yes
	entry:
		'item-picker': './src/item-picker/scripts/index.coffee'
		'todo-mvc'   : './src/todo-mvc/scripts/index.coffee'
		'priority-list'   : './src/priority-list/scripts/index.coffee'
	output:
		path: path.join __dirname, "dist"
		publicPath: 'dist/'
		filename: '[name].js'
		chunkFilename: '[chunkhash].js'
	module:
		loaders: [
			test: /\.coffee$/, loader: 'coffee'
		]
