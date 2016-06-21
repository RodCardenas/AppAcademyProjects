var React = require("react");
var TodoStore = require("../stores/todo_store");
var TodoListItem = require("./todo_list_item");
var TodoForm = require("./todo_form");

var TodoList = React.createClass({
  getInitialState: function() {
    return {todos: TodoStore.all()};
  },

  componentDidMount: function(){
    TodoStore.addChangedHandler(this.todosChanged);
    TodoStore.fetch();
  },

  componentWillUnmount: function(){
    TodoStore.removeChangedHandler(this.todosChanged);
  },

  getTodoItems: function(){
    return this.state.todos.map(function(todo){
      return <TodoListItem todo={todo} key={todo.id} />;
    });
  },

  todosChanged: function() {
    this.setState({todos: TodoStore.all()});
  },

  render: function(){
    return (
      <div>
        {this.getTodoItems()}
        <TodoForm />
      </div>
    );
  }
});

module.exports = TodoList;
