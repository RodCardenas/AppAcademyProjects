var React = require('react');
var PostStore = require('../stores/postStore.js');
var ClientActions = require('../actions/clientActions.js');
var Link = require('react-router').Link;
var hashHistory = require('react-router').hashHistory;

module.exports = React.createClass({
  getInitialState: function(){
    var post = PostStore.find(this.props.params.postId);
    return ({title: post.title, body:post.body, id:post.id});
  },

  handleSubmit: function(event){
    event.preventDefault();
    ClientActions.editPost(this.state);
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
