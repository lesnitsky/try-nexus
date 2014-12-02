module.exports = (grunt) ->

	(require 'load-grunt-tasks') grunt

	grunt.initConfig
		App:
			src:
				scripts: './src/scripts'
			build: './build'

		watch:
			app:
				files: '<%= App.src.scripts %>/*.coffee'
				tasks: ['coffee']
				options:
					livereload: yes

		coffee:
			compile:
				options:
					sourceMap: yes
				files:
					'<%= App.build %>/app.js': '<%= App.src.scripts %>/app.coffee'

		connect:
			livereload:
				options:
					port: 3000


	grunt.registerTask 'default', ['coffee', 'connect', 'watch']
