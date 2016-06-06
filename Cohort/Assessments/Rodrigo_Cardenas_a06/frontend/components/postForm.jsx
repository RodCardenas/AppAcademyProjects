var React = require('react');
var ClientActions = require('../actions/clientActions.js');

module.exports = React.createClass({
  getInitialState: function(){
    return ({title:"", body:""});
  },

  handleSubmit: function(event){
    event.preventDefault();
    ClientActions.createPost(this.state);
  },

  tChange: function(event){
    this.setState({title:event.target.value});
  },

  bChange: function(event){
    this.setState({body:event.target.value});
  },

  render: function () {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" onChange={this.tChange} value={this.state.title}></input>
          <input type="textarea" onChange={this.bChange} value={this.state.body}></input>
          <input type="submit"></input>
        </form>
      </div>
    );
  }
});
