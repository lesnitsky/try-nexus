ToDoItemView = (app, item) ->
	nxt.Element 'li',
		nxt.Binding item.edit, (edit) ->
			nxt.Class 'editing' if edit

		nxt.Binding item.done, (done) ->
			nxt.Class 'completed' if done

		nxt.Element 'div',
			nxt.Class 'view'

			nxt.Binding item.done, (done) ->
				nxt.Class 'done' if done

			nxt.Element 'input',
				nxt.Attr 'type', 'checkbox'
				nxt.Class 'toggle'
				nxt.Binding item.done, (done) ->
					nxt.Attr 'checked' if item.done.value
				nxt.Event 'click', (e) ->
					app.toggle_done item

			nxt.Element 'label',
				nxt.Event 'dblclick', ->
					item.toggle_edit()
				nxt.Text item.content.value

			nxt.Element 'button',
				nxt.Class 'destroy'
				nxt.Event 'click', ->
					app.remove_todo item
		nxt.Element 'input',
			nxt.Attr 'type', 'text'
			nxt.Class 'edit'
			nxt.ValueBinding item.content
			nxt.Binding item.content, (content) ->
				if not content or content.length is 0
					nxt.Class 'error'
			nxt.Event 'keypress', ({keyCode}) ->
				item.save() if keyCode is 13


module.exports = ToDoItemView
