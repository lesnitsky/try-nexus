class ToDoItem
	constructor: ->
		@content = new nx.Cell value:null
		@done = new nx.Cell value:no
		@edit = new nx.Cell value:no

	toggle_done: ->
		@done.value = not @done.value

	toggle_edit: ->
		@edit.value = not @edit.value

	save: ->
		@toggle_edit() if @content.value.length > 0

class App
	constructor: ->
		@items = new nx.Collection
		@new_item = new nx.Cell value: new ToDoItem

	add_todo: ->
		@items.append @new_item.value
		@new_item.value = new ToDoItem

	remove_todo: (item) ->
		@items.remove item

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

ToDoListView = (app, items) ->
	nxt.Collection items, (item) ->
		nxt.Element 'ul',
			nxt.Element 'li',
				ToDoItemView app, item

ToDoItemView = (app, item) ->
	nxt.Element 'div',
		nxt.Class 'panel'
		nxt.Class 'row'

		nxt.Element 'div',
			nxt.Class 'large-2'
			nxt.Class 'columns'

			nxt.Element 'div',
				nxt.Class 'switch'
				nxt.Element 'input',
					nxt.Attr 'type', 'checkbox'
					nxt.Binding item.done, (done) ->
						nxt.Attr 'checked' if item.done.value

				nxt.Element 'label', 

					nxt.Event 'click', (e) ->
						item.toggle_done()

		nxt.Element 'div',
			nxt.Class 'large-8'
			nxt.Class 'columns'
			nxt.Binding item.edit, (edit) ->
				if edit
					nxt.Element 'input',
						nxt.Attr 'type', 'text'
						nxt.ValueBinding item.content
						nxt.Binding item.content, (content) ->
							if not content or content.length is 0
								nxt.Class 'error'
						nxt.Event 'keypress', ({keyCode}) ->
							item.save() if keyCode is 13
				else
					nxt.Element 'p',
						nxt.Text item.content.value
						nxt.Event 'dblclick', ->
							item.toggle_edit()

		nxt.Element 'div',
			nxt.Class 'large-2'
			nxt.Class 'columns'

			nxt.Element 'a',
				nxt.Class 'button'
				nxt.Class 'tiny'
				nxt.Text 'Remove'
				nxt.Event 'click', ->
					app.remove_todo item

document.querySelector '.app.todo-mvc'
	.appendChild(AppView(new App).data.node)
