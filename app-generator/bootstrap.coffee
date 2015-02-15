interpolate = require 'interpolate'
walk        = require 'walk'
path        = require 'path'
fs          = require 'fs'

pathToTemplateApp = path.join __dirname, 'template-app'

bootstrap = (appName, pathToApp) ->
	ccAppName = toCamelCase appName
	walker = walk.walk pathToTemplateApp

	walker.on 'file', (root, {name}, next) ->
		filename = interpolate name, app:appName

		content = fs.readFileSync "#{root}/#{name}", encoding:'UTF-8'
		content = interpolate content,
			app: ccAppName
			appName: appName

		relativePath = path.relative pathToTemplateApp, "#{root}/#{filename}"
		pathToFile = path.join pathToApp, relativePath

		console.log pathToFile
		console.log content

		fs.writeFileSync pathToFile, content
		do next

	walker.on 'directory', (root, {name}, next) ->
		dirPath = path.relative pathToTemplateApp, "#{root}/#{name}"
		fs.mkdirSync path.join pathToApp, dirPath
		do next

toCamelCase = (str) ->
	parts = str.split '-'
	parts
		.map (part) ->
			"#{part[0].toUpperCase()}#{part.substr(1)}"
		.join ''

module.exports = bootstrap
