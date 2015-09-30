class TodoApp.Routers.Todos extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    view = new TodoApp.Views.TodosIndex()
    $("#container").html(view.render().el)
