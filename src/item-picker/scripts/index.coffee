{nx} = require 'nexus'

# viewmodels
ItemPickerVM                 = require './view-models/item-picker.vm.coffee'

# views
{ItemView, SelectedItemView} = require './views/item.view.coffee'
AppView                      = require './views/app.view.coffee'

# data
items                        = require './data.coffee'

class App
	constructor: ->
		@item_picker_vm = new ItemPickerVM
			items: items
			placeholder: 'Pick item'
			item_view: ItemView
			selected_item_view: SelectedItemView
			filter_key: 'name'

window.ItemPicker = (node) ->
	node.appendChild(AppView(new App).data.node)
