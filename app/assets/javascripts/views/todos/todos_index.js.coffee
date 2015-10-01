class TodoApp.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTodo, this)
    this

  appendTodo: (todo) ->
    console.log("doing thingy")
    view = new TodoApp.Views.Todo({
      model: todo
    })
    $(@el).find("#todos").append(view.render().el)
