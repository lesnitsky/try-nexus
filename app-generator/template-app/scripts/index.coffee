{app}VM   = require './view-models/{app}.vm.coffee'
{app}View = require './views/{app}.view.coffee'

window.{app} = (node) ->
	node.appendChild {app}View(new {app}VM).data.node
	{app}VM
