AppView = (app) ->
	nxt.Element 'main',
		nxt.Element 'div',
			nxt.Class 'priority-list'
			nxt.Collection app.items, (item) ->
				nxt.Element 'div',
					nxt.Class 'priority-list-item'
					nxt.Class 'panel'
					nxt.Element 'div',
						nxt.Text item.name
					nxt.Binding app.selectedItem, (selectedItem) ->
						nxt.Class 'selected' if item is selectedItem

					nxt.Event 'click', ->
						app.selectItem item

			nxt.Element 'div',
				nxt.Class 'controls'
				nxt.Element 'button',
					nxt.Class 'up'
					nxt.Event 'click', ->
						app.moveUp()
				nxt.Element 'button',
					nxt.Class 'down'
					nxt.Event 'click', ->
						app.moveDown()

module.exports = AppView
