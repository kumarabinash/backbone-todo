class TodoApp.Views.Todo extends Backbone.View

  template: JST['todos/todo']

  render: ->
   $(@el).html(@template(todo: @model))
   console.log @model.toJSON()
   this
 
