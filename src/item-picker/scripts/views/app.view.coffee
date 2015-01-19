ItemPickerView = require './item-picker.view.coffee'

AppView = (app) ->
	nxt.Element 'main',
		ItemPickerView app.item_picker_vm

module.exports = AppView
