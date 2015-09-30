window.TodoApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new TodoApp.Routers.Todos()
    Backbone.history.start()

$(document).ready ->
  TodoApp.initialize()
