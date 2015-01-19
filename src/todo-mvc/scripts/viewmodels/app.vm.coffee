ToDoItem = require './todo-item.vm.coffee'

class App
	constructor: ->
		@items = new nx.Collection
		@new_item = new nx.Cell value: new ToDoItem

	add_todo: ->
		@items.append @new_item.value
		@new_item.value = new ToDoItem

	remove_todo: (item) ->
		@items.remove item

module.exports = App
