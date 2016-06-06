var React = require('react');
var Link = require('react-router').Link;
var ClientActions = require('../actions/clientActions.js');
var hashHistory = require('react-router').hashHistory;

module.exports = React.createClass({
  handleEdit: function(post){
    ClientActions.updatePost(post);
  },

  handleDelete: function(post){
    ClientActions.deletePost(post.id);
  },

  render: function () {
    var post = this.props.post;
    var link = "/api/posts/" + post.id;
    return (
      <li>
        <Link to={link}>{post.title}</Link>
        <button
          method="DELETE" onClick={this.handleDelete.bind(this, post)}>Delete
        </button>
        <button
          method="PATCH" onClick={this.handleEdit.bind(this,post)}>Edit
        </button>
      </li>
    );
  }
});
