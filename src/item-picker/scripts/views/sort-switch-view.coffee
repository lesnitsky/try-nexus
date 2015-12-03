SortSwitchView = ($) ->
	nxt.Element 'div',
		nxt.Text 'Sort:'

		nxt.Element 'select',
			nxt.Element 'option',
				nxt.Attr 'value', 'ascending'
				nxt.Text 'A → Z'
			nxt.Element 'option',
				nxt.Attr 'value', 'descending'
				nxt.Text 'Z → A'
			nxt.ValueBinding $.sort

module.exports = SortSwitchView
