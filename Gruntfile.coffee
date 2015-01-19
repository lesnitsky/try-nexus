module.exports = (grunt) ->

	(require 'load-grunt-tasks') grunt
	webpackConfig = require './webpack.config'

	grunt.initConfig
		'webpack-dev-server':
			options:
				webpack: webpackConfig
				publicPath: "/#{webpackConfig.output.publicPath}"
			start:
				keepAlive: yes
				webpack:
					devtool: 'eval'
					debug: yes

	grunt.registerTask 'default', ['webpack-dev-server:start']
