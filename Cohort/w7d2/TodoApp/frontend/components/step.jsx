var React = require("react");
var StepStore = require("../stores/step_store");
var DoneButton = require("./done_button");

var Step = React.createClass({
  handleClick: function(event){
    StepStore.destroy(this.props.step.id);
  },

  render: function(){
    return(
      <li>
        {this.props.step.body}
        <DoneButton store={StepStore} obj={this.props.step}/>
        <button className="btn btn-primary" type="submit" onClick={this.handleClick}>Delete</button>
      </li>
    );
  }


});

module.exports = Step;
