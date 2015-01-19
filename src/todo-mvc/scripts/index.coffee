App     = require './viewmodels/app.vm.coffee'
AppView = require './views/app.view.coffee'

window.ToDoMVC = (node) ->
	node.appendChild(AppView(new App).data.node)
