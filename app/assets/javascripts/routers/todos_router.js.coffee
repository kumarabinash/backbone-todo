class TodoApp.Routers.Todos extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new TodoApp.Collections.Todos()
    that = this
    @collection.fetch({
      success: ->
        that.data = that.collection.models
        that.collection.reset(that.data)
    })

  index: ->
    view = new TodoApp.Views.TodosIndex(collection: @collection)
    $("#container").html(view.render().el)
