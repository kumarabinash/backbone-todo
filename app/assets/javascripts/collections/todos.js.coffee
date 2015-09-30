class TodoApp.Collections.Todos extends Backbone.Collection

  model: TodoApp.Models.Todo
  url: '/api/todos'
