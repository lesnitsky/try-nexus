ToDoItemView = require './todo-item.view.coffee'

ToDoListView = (app, items) ->
	nxt.Collection items, (item) ->
		nxt.Element 'ul',
			nxt.Element 'li',
				ToDoItemView app, item

module.exports = ToDoListView
