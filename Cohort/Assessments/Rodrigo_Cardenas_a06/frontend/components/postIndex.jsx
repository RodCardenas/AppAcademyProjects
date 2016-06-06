var React = require('react');
var PostStore = require('../stores/postStore.js');
var ClientActions = require('../actions/clientActions.js');

var PostIndexItem = require('./postIndexItem.jsx');
var PostForm = require('./postForm.jsx');

module.exports = React.createClass({
  getInitialState: function(){
    return ({posts: []});
  },

  componentDidMount: function(){
    ClientActions.fetchPosts();
    this.listenerToken = PostStore.addListener(this.onChange);
  },

  onChange: function(posts){
    this.setState({posts: PostStore.all()});
  },

  render: function () {
    var posts = this.state.posts.map(function(post){
      return <PostIndexItem key={post.id} post={post} />;
    }.bind(this));

    return (
      <div className="post-index">
        <ul>{posts}</ul>
        <PostForm />
      </div>
    );
  }
});
