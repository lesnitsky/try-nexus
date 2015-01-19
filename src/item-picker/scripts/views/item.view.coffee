ItemView = (item) ->
	nxt.Element 'div',
		nxt.Class 'panel'
		nxt.Element 'div',
			nxt.Text item.name
		nxt.Element 'div',
			nxt.Text item.gender

SelectedItemView = (item) ->
	nxt.Element 'div',
		nxt.Text item.name

module.exports =
	ItemView:         ItemView
	SelectedItemView: SelectedItemView
