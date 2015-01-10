items = [
	{
		"name": "Christi Ochoa",
		"gender": "female"
	},
	{
		"name": "Kerry Boyle",
		"gender": "female"
	},
	{
		"name": "Ruby Copeland",
		"gender": "female"
	},
	{
		"name": "Natasha Foley",
		"gender": "female"
	},
	{
		"name": "Louella Clark",
		"gender": "female"
	},
	{
		"name": "Katie Bell",
		"gender": "female"
	},
	{
		"name": "Osborne Barron",
		"gender": "male"
	},
	{
		"name": "Mitchell Lyons",
		"gender": "male"
	},
	{
		"name": "Taylor Morton",
		"gender": "female"
	},
	{
		"name": "Blanca Burks",
		"gender": "female"
	},
	{
		"name": "Victoria Reese",
		"gender": "female"
	},
	{
		"name": "Leta Palmer",
		"gender": "female"
	},
	{
		"name": "Sexton Jordan",
		"gender": "male"
	},
	{
		"name": "Courtney Garcia",
		"gender": "female"
	},
	{
		"name": "Cooke Mcdaniel",
		"gender": "male"
	},
	{
		"name": "Hardin Cameron",
		"gender": "male"
	},
	{
		"name": "Hale Ingram",
		"gender": "male"
	},
	{
		"name": "May Newman",
		"gender": "female"
	},
	{
		"name": "Bowen Meadows",
		"gender": "male"
	},
	{
		"name": "Park Vaughn",
		"gender": "male"
	}
]

ItemPicker = ($) ->
	nxt.Element 'div',
		nxt.Element 'div',
			nxt.Class 'panel'
			nxt.Event 'click', $.toggle
			nxt.Binding $.selected_item, (item) ->
				if item
					$.selected_item_view item
				else
					console.log $.placeholder
					nxt.Text $.placeholder

		nxt.Binding $.opened, (opened) ->
			if opened
				nxt.Element 'div',
					nxt.Element 'div',
						nxt.Class 'panel'
						nxt.Element 'input',
							nxt.Attr 'type', 'text'
							nxt.ValueBinding $.filter
					nxt.Element 'ul',
						nxt.Attr 'style', 'overflow: auto; max-height: 300px; border: 1px solid #d8d8d8'
						nxt.Collection $.filtered_items, (item) ->
							nxt.Element 'li',
								$.item_view item

						nxt.Binding $.filtered_items, ({length}) ->
							if not length
								nxt.Element 'div',
									nxt.Class 'panel'
									nxt.Text 'No items to display'

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


AppView = (app) ->
	nxt.Element 'main',
		ItemPicker app.item_picker_vm

ItemView = (item) ->
	nxt.Element 'div',
		nxt.Class 'panel'
		nxt.Element 'div',
			nxt.Text item.name
		nxt.Element 'div',
			nxt.Text item.gender

SelectedItemView = (item) ->
	nxt.Element 'div',
		nxt.Class 'panel'
		nxt.Text item.name

class App
	constructor: ->
		@item_picker_vm = new ItemPickerVM
			items: items
			placeholder: 'Pick item'
			item_view: ItemView
			selected_item_view: SelectedItemView
			filter_key: 'name'

document.querySelector '.app.item-picker'
	.appendChild(AppView(new App).data.node)
