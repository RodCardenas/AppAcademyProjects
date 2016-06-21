var React = require("react");
var TodoStore = require("../stores/todo_store");
var StepStore = require("../stores/step_store");
var Step = require("./step");
var StepForm = require("./step_form");

var TodoDetailView = React.createClass({
  getInitialState: function(){
    return {shown: false};
  },

  componentDidMount: function(){
    StepStore.addChangedHandler(this.stepsChanged);
    StepStore.fetch(this.props.todo.id);
  },

  willComponentUnmount: function(){
    StepStore.removeChangedHandler(this.stepsChanged);
  },

  stepsChanged: function() {
    this.setState({steps: StepStore.all(this.props.todo.id)});
  },

  handleClick: function(event){
    TodoStore.destroy(this.props.todo.id);
  },

  toggleShow: function(e){
    this.setState({shown: !this.state.shown});
  },

  listSteps: function(){
    return this.state.steps.map(function(step){
      return <Step step={step} key={step.id} />;
    });
  },

  render: function(){
    if (this.state.shown){
      return (
        <div>
          {this.props.todo.body}
          <ul>
            {this.listSteps()}
          </ul>
          <StepForm todo={this.props.todo} />
          <button className="btn btn-primary" type="submit" onClick={this.handleClick}>Delete</button>
        </div>
      );
    } else{
      return null;
    }
  }
});

module.exports = TodoDetailView;
