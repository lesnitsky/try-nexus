
ItemForm = (item, app) ->
	nxt.Element 'div',
		nxt.Element 'input',
			nxt.Attr 'type', 'text'
			nxt.ValueBinding item.name
			nxt.Event 'keypress', (ev) ->
				app.save_new_item item if ev.keyCode is 13
		nxt.Element 'button',
			nxt.Class 'expand'
			nxt.Text 'Save'
			nxt.Event 'click', ->
				app.save_new_item item

ItemView = (app, item, state) ->
	nxt.Element 'div',
		nxt.Class 'panel'
		nxt.Binding state.edit, (edit) ->
			if not edit
				nxt.Text item.name.value
			else
				nxt.Element 'input',
					nxt.Attr 'type', 'text'
					nxt.ValueBinding item.name
					nxt.Event 'blur', (ev) ->
						if item.name
							app.item_to_edit.value = null
					nxt.Event 'keypress', (ev) ->
						app.item_to_edit.value = null if ev.keyCode is 13
		nxt.Event 'dblclick', ->
			app.edit_item item

AppView = (app) ->
	nxt.Element 'main',
		nxt.Collection app.items, (item) ->
			nxt.Binding app.item_to_edit, (item_to_edit) ->
				item_state =
					edit: new nx.Cell value:no
				item_state.edit.value = yes if item is item_to_edit
				ItemView app, item, item_state

		nxt.Binding app.new_item, (new_item) ->
			if new_item
				ItemForm app.new_item.value, app
			else
				nxt.Element 'button',
					nxt.Class 'expand'
					nxt.Text 'Create new item'
					nxt.Attr 'autofocus'
					nxt.Event 'click', ->
						do app.create_new_item

class Item
	constructor: ->
		@name = new nx.Cell value:''

class App
	constructor: ->
		@items = new nx.Collection
		@new_item = new nx.Cell value:null
		@item_to_edit = new nx.Cell value:null

	create_new_item : ->
		@new_item.value = new Item

	save_new_item: (new_item) ->
		@items.append new_item
		@new_item.value = null

	edit_item: (item_to_edit) ->
		@item_to_edit.value = item_to_edit

document.body.appendChild(AppView(new App).data.node)
