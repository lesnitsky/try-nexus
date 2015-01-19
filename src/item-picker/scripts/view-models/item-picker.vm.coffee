class ItemPickerVM
	constructor: ({items, @item_view, @selected_item_view, @placeholder, @filter_key}) ->
		@items = new nx.Collection items:items
		@filtered_items = new nx.Collection items:items
		@filter = new nx.Cell value:''
		@selected_item = new nx.Cell value:null
		@opened = new nx.Cell value:no

		@filtered_items.bind @filter, '<-', (filter) =>
			@items.value.filter (item) =>
				(item[@filter_key].indexOf @filter.value) isnt -1

	toggle: =>
		@opened.value = not @opened.value

	select: (item) ->
		@selected_item.value = item

module.exports = ItemPickerVM
