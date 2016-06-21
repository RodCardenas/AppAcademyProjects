var React = require("react");
var TodoStore = require("../stores/todo_store");
var DoneButton = require("./done_button");
var TodoDetailView = require("./todo_detail_view");

var TodoListItem = React.createClass({
  saveRef: function(tdv){
    this.tdv = tdv;
  },

  componentDidMount: function(){
    var self = this;
    setTimeout(function(){
      self.setState({loaded: true});
    }, 0);
  },

  render: function(){
    return(
      <div>
        <div onClick={this.tdv ? this.tdv.toggleShow : null}>
          <b>{this.props.todo.title}</b>
        </div>
        <TodoDetailView todo={this.props.todo} ref={this.saveRef}/>
        <div>
          <DoneButton store={TodoStore} obj={this.props.todo}/>
        </div>
      </div>
    );
  }

});

module.exports = TodoListItem;
