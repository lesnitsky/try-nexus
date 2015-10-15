path = require 'path'
fs   = require 'fs'
webpack = require 'webpack'

pathToApps = path.join __dirname, 'src'
apps = fs.readdirSync(pathToApps)
	.filter (file) ->
		fs.statSync(pathToApps, file)
			.isDirectory()

entry = {}
apps.forEach (appName) ->
	entry[appName] = "./src/#{appName}/scripts/index.coffee"

module.exports =
	cache: yes
	entry: entry
	output:
		path: path.join __dirname, "dist"
		publicPath: 'dist/'
		filename: '[name].js'
		chunkFilename: '[chunkhash].js'
	module:
		loaders: [
			test: /\.coffee$/, loader: 'coffee'
		]
	resolve:
		modulesDirectories: ['bower_components']
	plugins: [
		new webpack.ResolverPlugin(
			new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin 'bower.json', ['main']
		)
	]
