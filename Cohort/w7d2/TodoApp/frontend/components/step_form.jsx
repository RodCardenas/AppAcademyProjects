var React = require("react");
var StepStore = require("../stores/step_store");

var StepForm = React.createClass({
  getInitialState: function(){
    return {body: ""};
  },

  updateBody: function(event){
    this.setState({body: event.currentTarget.value});
  },

  handleSubmit: function(event){
    event.preventDefault();
    StepStore.create(this.props.todo.id, this.state);
    this.setState({body: ""});
  },

  render: function(){
    return(
      <form onSubmit={this.handleSubmit}>
        <label>Body
          <input type="text" value={this.state.body} onChange={this.updateBody} />
        </label>
        <input type="submit" value="Create a New Step"/>
      </form>
    );
  }
});

module.exports = StepForm;
