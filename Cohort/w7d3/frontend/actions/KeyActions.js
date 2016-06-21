var AppDispatcher = require("../dispatcher/dispatcher.js");

var KeyActions = {
  keyPressed: function(noteString){
    AppDispatcher.dispatch({
      actionType: 'ADD',
      note: noteString
    });
  },

  keyUnPressed: function(noteString){
    AppDispatcher.dispatch({
      actionType: 'REMOVE',
      note: noteString
    });
  },
};

module.exports = KeyActions;
