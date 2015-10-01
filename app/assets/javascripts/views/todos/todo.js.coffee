class TodoApp.Views.Todo extends Backbone.View

  template: JST['todos/todo']

  events:
    "click .todo-item": "diplayDetails"

  tagName: "li"

  render: ->
    $(@el).html(@template(todo: @model))
    this

  displayDetails: ->
    console.log "Displaying details"
 
