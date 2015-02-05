ItemsLeftView = (count) ->
	nxt.Element 'span',
		nxt.Attr 'id', 'todo-count'

			nxt.Element 'strong',
				nxt.Text "#{count} item#{if count > 1 then 's' else ''}"

FilterView = (app, filter_content, bound_items) ->
	nxt.Element 'li',
		nxt.Element 'a',
			nxt.Attr 'href', '#'
			nxt.Binding app.visible_items, (visible_items) ->
				nxt.Class 'selected' if visible_items is bound_items
			nxt.Text filter_content
		nxt.Event 'click', (e) ->
			e.preventDefault()
			app.display bound_items



FooterView = (app) ->
	nxt.Element 'footer',
		nxt.Attr 'id', 'footer'

		nxt.Binding app.items_todo.length, (count) ->
			ItemsLeftView count

		nxt.Element 'ul',
			nxt.Attr 'id', 'filters'
			FilterView app, 'All', app.items
			FilterView app, 'Active', app.items_todo
			FilterView app, 'Completed', app.done_items

		nxt.Binding app.done_items.length, (count) ->
			nxt.Element 'button',
				nxt.Attr 'id', 'clear-completed'
				nxt.Text "Clear completed (#{count})"
				nxt.Event 'click', -> app.clear_completed()

module.exports = FooterView
