bootstrap = require './bootstrap.coffee'
path      = require 'path'
fs        = require 'fs'

appName = process.argv[2]
appsRootFolder = path.join __dirname, '..', 'src'

unless appName
	console.log '"undefined" is not really good name for application'
else
	pathToApp = path.join appsRootFolder, appName
	fs.mkdirSync pathToApp
	bootstrap appName, pathToApp
