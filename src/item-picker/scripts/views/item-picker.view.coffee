ItemPickerView = ($) ->
	nxt.Element 'div',
		nxt.Element 'div',
			nxt.Class 'panel'
			nxt.Event 'click', $.toggle
			nxt.Binding $.selected_item, (item) ->
				if item
					$.selected_item_view item
				else
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
						nxt.Style
							'overflow':   'auto'
							'max-height': '300px'
							'border':     '1px solid #d8d8d8'
						nxt.Collection $.filtered_items, (item) ->
							nxt.Element 'li',
								$.item_view item
								nxt.Event 'click', $.selected_item, -> item

						nxt.Binding $.filtered_items, ({length}) ->
							if not length
								nxt.Element 'div',
									nxt.Class 'panel'
									nxt.Text 'No items to display'

module.exports = ItemPickerView
