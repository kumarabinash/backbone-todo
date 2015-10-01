class TodoApp.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  events:
    "click #todos.todo-item": "diplayDetails"
    "click #btn-add-todo": "addTodo"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTodo, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTodo, this)
    this

  appendTodo: (todo) ->
    view = new TodoApp.Views.Todo({
      model: todo
    })
    $(@el).find("#todos").append(view.render().el)

  displayDetails: ->
    console.log "Hello there"

  addTodo: (e) ->
    e.preventDefault()
    todo_task = $("#todo-task").val()
    attributes = task: $("#todo-task").val()
    @collection.create attributes,
      wait: true,
      success: -> $("#todo-task").val("")
      error: -> @handleError
