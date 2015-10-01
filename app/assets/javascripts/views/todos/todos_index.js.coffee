class TodoApp.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  events:
    "click #btn-add-todo": "addTodo"
    "keypress": "keyPressed"

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

  addTodo: (e) ->
    e.preventDefault()
    todo_task = $("#todo-task").val()
    attributes = task: $("#todo-task").val()
    @collection.create attributes,
      wait: true,
      success: -> $("#todo-task").val("")
      error: -> @handleError
  
  keyPressed: ->
    console.log "Key Pressed"
