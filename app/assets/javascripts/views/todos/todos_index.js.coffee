class TodoApp.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  events:
    "click #btn-add-todo": "addTodo"
    "keypress": "keyPressed"
    "click .delete-todo": "deleteTodo"

  initialize: ->
    @collection.on('reset', @render, this)
    #@collection.on('reset', $("#filters").append @createStatusLinks, this)
    @collection.on('add', @appendTodo, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTodo, this)
    $("#filters").append @createStatusLinks
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

  getStatus: ->
    #This will select all the types of statuses uniquely
    console.log "get status works"
    statuses =_.uniq @collection.pluck('status'), false, (status) ->
      status.toLowerCase()

  createStatusLinks: ->
    #This first creates the a div to contain all the links that we will create
    #And then appends the links to to and returns it
    console.log "Create Status links works"
    #filterStatusContainer = $ "<div />"
    _.each @getStatus, (status) ->
      console.log status
      lin = $ "<div/>", {
        text: "http://abinash.com",
	#class: filterByStatus
      }
      console.log lin
      lin.appendTo(filterStatusContainer)
      console.log "end of create"
    #filterStatusContainer 
  
  deleteTodo: (e) ->
    e.preventDefault()
    todoId = e.currentTarget.getAttribute("data-todoId")
    model = @collection.get(todoId)
    model.destroy()
    @collection.remove(model)
    data = @collection.models
    @collection.reset(data)
