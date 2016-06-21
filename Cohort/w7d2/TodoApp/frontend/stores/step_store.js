var _steps = {};
var _callbacks = [];

var StepStore = {
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

  all: function(todoId){
    if(todoId && _steps[todoId]){
      var _todoSteps =  _steps[todoId];
      var keys = Object.keys(_todoSteps);
      var todosStepsCopy = [];

      for (var i = 0; i < keys.length; i++) {
        todosStepsCopy.push(_todoSteps[keys[i]]);
      }

      return todosStepsCopy;
    }
  },

  findById: function(stepId){
    var todos = Object.keys(_steps);
    for (var i = 0; i < todos.length; i++) {
      var stepKeys = Object.keys(_steps[todos[i]]);
      for (var j = 0; j < stepKeys.length; j++) {
        var step = _steps[todos[i]][stepKeys[j]];
        if(step.id === stepId){
          return step;
        }
      }
    }
  },

  fetch: function(todoId){
    if(todoId){
      $.ajax({
        url: "/api/todos/" + todoId + "/steps",
        method: "GET",
        success: function(steps){
          delete _steps[todoId];
          _steps[todoId] = {};

          for (var i = 0; i < steps.length; i++) {
            _steps[todoId][steps[i].id] = steps[i];
          }

          StepStore.changed();
        }
      });
    }
  },

  create: function(todoId, data){
    if (!_steps[todoId]){
      _steps[todoId] = {};
    }

    $.ajax({
      url: "/api/todos/" + todoId + "/steps",
      method: "POST",
      data: {step: data},
      success: function(step){
        _steps[todoId][step.id] = step;
        StepStore.changed();
      }
    });
  },

  destroy: function(id){
    var step = StepStore.findById(id);
    if(step){
      $.ajax({
        url: "api/steps/" + id,
        method: "DELETE",
        success: function(){
          delete _steps[step.todo_id][id];
          StepStore.changed();
        }
      });
    }
  },

  toggleDone: function(id){
    var step = StepStore.findById(id);
    if(step){
      var toggleVal = !(step.done);

      $.ajax({
        url: "api/steps/" + id,
        method: "PATCH",
        data: {step: {done: toggleVal}},
        success: function(){
          step.done = toggleVal;
          StepStore.changed();
        }
      });
    }
  }
};

module.exports = StepStore;
