App     = require './viewmodels/app.vm.coffee'
AppView = require './views/app.view.coffee'

window.PriorityList = (node) ->
	node.appendChild(AppView(new App).data.node)
