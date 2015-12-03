class ItemPickerVM
	constructor: ({items, @item_view, @selected_item_view, @placeholder, @filter_key}) ->
		Sort =
			ASCENDING:  'ascending'
			DESCENDING: 'descending'

		Compare =
			"#{Sort.ASCENDING}": ([first], [second]) ->
					first.name.localeCompare second.name
			"#{Sort.DESCENDING}": ([first], [second]) ->
					second.name.localeCompare first.name


		@items = new nx.Collection items:items

		@filter = new nx.Cell
		@sort = new nx.Cell

		@selected_item = new nx.Cell value:null
		@opened = new nx.Cell value:no

		@filtered_items = @items
			.filter
				filter: new nx.Cell
					'<-': [
						@filter
						(query) =>
							(item) =>
								(item[@filter_key].indexOf query) isnt -1
					]
			.sort
				compare: new nx.Cell
					'<-': [
						@sort
						(sort) -> Compare[sort]
					]

		@sort.value = Sort.ASCENDING
		@filter.value = ''

	toggle: =>
		@opened.value = not @opened.value

module.exports = ItemPickerVM
