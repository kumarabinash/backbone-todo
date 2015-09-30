class TodoApp.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  render: ->
    @collection = new TodoApp.Collections.Todos()
    @collection.fetch();
    $(@el).html(@template)
    this
