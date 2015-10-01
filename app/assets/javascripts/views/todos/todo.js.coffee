class TodoApp.Views.Todo extends Backbone.View

  template: JST['todos/todo']

  events:
    "click": "displayDetails"
    'click [type="checkbox"]': "completed"

  tagName: "li"

  render: ->
    $(@el).html(@template(todo: @model))
    this

  displayDetails: (e) ->
    e = e.currentTarget
    target = $(e).find(".todo-details")
    if target.hasClass("active")
      target.removeClass("active")
    else
      target.addClass("active")

  completed: (e) ->
    e = e.currentTarget
    target = $(e).parent()
    console.log target
    if e.checked
      @model.set({status: "complete"})
      @model.save()
      @render()
    else
      @model.set({status: "incomplete"})
      @model.save()
      @render()
