
ItemForm = (item, app) ->
	nxt.Element 'div',
		nxt.Element 'input',
			nxt.Attr 'type', 'text'
			nxt.Event 'input', (ev) ->
				item.name = ev.target.value
		nxt.Element 'button',
			nxt.Class 'expand'
			nxt.Text 'Save'
			nxt.Event 'click', ->
				app.save_new_item item


AppView = (app) ->
	nxt.Element 'main',
		nxt.Collection app.items, (item) ->
			nxt.Element 'div',
				nxt.Class 'panel'
				nxt.Text item.name
		nxt.Binding app.new_item, (new_item) ->
			if new_item
				ItemForm app.new_item.value, app
			else
				nxt.Element 'button',
					nxt.Class 'expand'
					nxt.Text 'Create new item'
					nxt.Event 'click', ->
						do app.create_new_item

class Item
	constructor: ->
		@name = ""

class App
	constructor: ->
		@items = new nx.Collection
		@new_item = new nx.Cell value:null

	create_new_item : ->
		@new_item.value = new Item

	save_new_item: (new_item) ->
		@items.append new_item
		@new_item.value = null

document.body.appendChild(AppView(new App).data.node)
