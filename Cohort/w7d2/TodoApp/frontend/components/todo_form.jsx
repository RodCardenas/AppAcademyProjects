var React = require("react");
var TodoStore = require("../stores/todo_store");

var TodoForm = React.createClass({
  getInitialState: function(){
    return {title: "", body: ""};
  },

  updateTitle: function(event){
    this.setState({title: event.currentTarget.value});
  },

  updateBody: function(event){
    this.setState({body: event.currentTarget.value});
  },

  handleSubmit: function(event){
    event.preventDefault();
    TodoStore.create(this.state);
    this.setState({title: "", body: ""});
  },

  render: function(){
    return(
      <form onSubmit={this.handleSubmit}>
        <label>Title
          <input type="text" value={this.state.title} onChange={this.updateTitle} />
        </label>
        <label>Body
          <input type="text" value={this.state.body} onChange={this.updateBody} />
        </label>
        <input type="submit" value="Create a New TODO"/>
      </form>
    );
  }
});

module.exports = TodoForm;
