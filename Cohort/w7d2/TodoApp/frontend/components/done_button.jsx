var React = require("react");
var TodoStore = require("../stores/todo_store");
var StepStore = require("../stores/step_store");

var DoneButton = React.createClass({
  handleClick: function(e){
    this.props.store.toggleDone(this.props.obj.id);
  },

  render: function(){
    var buttonText = this.props.obj.done ? "Undo" : "Done";
    return (
      <button className="btn btn-primary" type="submit" onClick={this.handleClick}>{buttonText}</button>
    );
  }
});

module.exports = DoneButton;
