ToDoItemView = require './todo-item.view.coffee'

ToDoListView = (app) ->
		nxt.Element 'section',

			nxt.Binding app.items.length, (length) ->
				nxt.Attr 'style', 'display:none' if length is 0

			nxt.Binding app.visible_items, (items) ->
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
