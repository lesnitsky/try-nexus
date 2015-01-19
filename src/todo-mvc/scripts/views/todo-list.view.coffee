ToDoItemView = require './todo-item.view.coffee'

ToDoListView = (app, items) ->
		nxt.Element 'section',
			nxt.Attr 'id', 'main'
			nxt.Element 'input',
				nxt.Attr 'id', 'toggle-all'
				nxt.Attr 'type', 'checkbox'
			nxt.Element 'label',
				nxt.Attr 'for', 'toggle-all'
			nxt.Element 'ul',
				nxt.Attr 'id', 'todo-list'
				nxt.Collection items, (item) ->
						ToDoItemView app, item

module.exports = ToDoListView
