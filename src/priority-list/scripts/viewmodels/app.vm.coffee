class AppVM
	constructor: ->
		rawItems = require '../../../item-picker/scripts/data.coffee'
		@items = new nx.Collection
			items: rawItems.slice 10

		@selectedItem = new nx.Cell value:null

	selectItem: (item) ->
		@selectedItem.value = item

	move: (item, itemToSwapWithIndex) ->
		itemToSwapWith = @items.value[itemToSwapWithIndex]
		@items.swap item, itemToSwapWith

	moveUp: ->
		if @selectedItem.value
			@move @selectedItem.value, @items.value.indexOf(@selectedItem.value) + 1

	moveUp: ->
		if @selectedItem.value
			@move @selectedItem.value, @items.value.indexOf(@selectedItem.value) - 1

module.exports = AppVM
