ToDoItem = require './todo-item.vm.coffee'

class App
	constructor: ->
		@items = new nx.Collection
		@done_items = new nx.RefinedCollection @items, filter:(item) ->
			item.done.value

		@items_todo = new nx.RefinedCollection @items, filter:(item) ->
			not item.done.value

		@visible_items = new nx.Cell value:@items

		@new_item = new nx.Cell value: new ToDoItem

	add_todo: ->
		@items.append @new_item.value
		@new_item.value = new ToDoItem

	remove_todo: (item) ->
		@items.remove item

	clear_completed: ->
		@items.remove @done_items.value...

	# workaround for filters
	toggle_done: (item) ->
		item.done.value = not item.done.value
		@items.reset @items.value

	display: (items) ->
		@visible_items.value = items

module.exports = App
