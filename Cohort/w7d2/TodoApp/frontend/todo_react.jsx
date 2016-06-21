var React = require("react");
var ReactDOM = require("react-dom");
var TodoList = require("./components/todo_list");
TodoStore = require("./stores/todo_store");
StepStore = require("./stores/step_store");


document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<TodoList />, document.getElementById("root"));
});
