var React = require('react');
var PostStore = require('../stores/postStore.js');
var ClientActions = require('../actions/clientActions.js');
var Link = require('react-router').Link;

module.exports = React.createClass({
  getInitialState: function(){
    var post = PostStore.find(this.props.params.postId);

    if ( post === undefined){
      return ({title: "", body:"", id:this.props.params.postId });
    } else {
      return ({title: post.title, body:post.body, id:post.id, post: post});
    }
  },

  componentDidMount: function(){
    this.listenerToken = PostStore.addListener(this.onChange);
    ClientActions.getPost(this.props.params.postId);
  },

  componentWillUnmount: function(){
    this.listenerToken.remove();
  },

  onChange: function(posts){
    var post = PostStore.find(this.props.params.postId);
    this.setState({title: post.title, body:post.body, id:post.id, post:post});
  },

  render: function () {
    var post = this.state;

    if(post.post !== undefined){
      var output = <div>
        {post.post.title}
        {post.post.body}
      </div>;
    } else {
      var output = <div>
        {post.title}
        {post.body}
      </div>;
    }

    return (
      <div id="post-container">
        {output}
      </div>
    );
  }
});
