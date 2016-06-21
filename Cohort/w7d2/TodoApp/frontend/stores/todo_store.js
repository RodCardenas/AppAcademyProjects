var _todos = {};
var _callbacks = [];

var TodoStore = {
  changed: function(){
    for (var i = 0; i < _callbacks.length; i++) {
      _callbacks[i]();
    }
  },

  addChangedHandler: function(cb){
    _callbacks.push(cb);
  },

  removeChangedHandler: function(cb){
    for (var i = 0; i < _callbacks.length; i++) {
      if (_callbacks[i] === cb){
        _callbacks.splice(i,1);
        break;
      }
    }
  },

  all: function(){
     var keys = Object.keys(_todos);
     var todosCopy = [];
     for (var i = 0; i < keys.length; i++) {
       todosCopy.push(_todos[keys[i]]);
     }
     return todosCopy;
  },

  findById: function(id){
    return _todos[id];
  },

  fetch: function(){
    $.ajax({
      url: "api/todos",
      method: "GET",
      success: function(todos){
        _todos = {};
        for (var i = 0; i < todos.length; i++) {
          _todos[todos[i].id] = todos[i];
        }
        TodoStore.changed();
      }
    });
  },

  create: function(data){
    $.ajax({
      url: "api/todos",
      method: "POST",
      data: {todo: data},
      success: function(todo){
        _todos[todo.id] = todo;
        TodoStore.changed();
      }
    });
  },

  destroy: function(id){
    if(_todos[id]){
      $.ajax({
        url: "api/todos/" + id,
        method: "DELETE",
        success: function(){
          delete _todos[id];
          TodoStore.changed();
        }
      });
    }
  },

  toggleDone: function(id){
    if(_todos[id]){
      var toggleVal = !(_todos[id].done);

      $.ajax({
        url: "api/todos/" + id,
        method: "PATCH",
        data: {todo: {done: toggleVal}},
        success: function(){
          _todos[id].done = toggleVal;
          TodoStore.changed();
        }
      });
    }
  }
};

module.exports = TodoStore;
