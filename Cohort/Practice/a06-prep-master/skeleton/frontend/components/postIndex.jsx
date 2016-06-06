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
    this.listener = PostStore.addListener(this.onChange);
  },

  onChange: function(){
    this.setState({posts: PostStore.all()});
  },

  render: function () {
    if(this.state.posts.length > 0){
      var posts = this.state.posts.map(function(post){
        return  <PostIndexItem key={post.id} post={post} />;
      }.bind(this));
    } else {
      posts = <div></div>;
    }
    return (
      <div className="post-index">
        <PostForm />
        <ul>
          {posts}
        </ul>
      </div>
    );
  }
});
