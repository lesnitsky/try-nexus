ToDoListView = require './todo-list.view.coffee'

AppView = (app) ->
	nxt.Element 'main',
		nxt.Binding app.new_item, (item) ->
			nxt.Element 'input',
				nxt.Attr 'type', 'text'
				nxt.ValueBinding item.content
				nxt.Event 'keypress', ({keyCode}) ->
					if keyCode is 13
						app.add_todo()

		ToDoListView app, app.items


module.exports = AppView
