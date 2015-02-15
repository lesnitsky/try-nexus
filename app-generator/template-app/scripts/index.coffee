{app}VM   = require './view-models/{appName}.vm.coffee'
{app}View = require './views/{appName}.view.coffee'

window.{app} = (node) ->
	node.appendChild {app}View(new {app}VM).data.node
	{app}VM
