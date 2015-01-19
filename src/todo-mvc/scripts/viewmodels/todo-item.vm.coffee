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

module.exports = ToDoItem
