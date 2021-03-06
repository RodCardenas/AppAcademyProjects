var AppDispatcher = require('../dispatcher/dispatcher.js');
var PostConstants = require('../constants/postConstants.js');

var ServerActions = {
  receiveAll: function(posts){
    AppDispatcher.dispatch({
      posts: posts,
      actionType: PostConstants.POSTS_RECEIVED
    });
  },

  receivePost: function(post){
    AppDispatcher.dispatch({
      post: post,
      actionType: PostConstants.POST_RECEIVED
    });
  },

  removePost: function(post){
    AppDispatcher.dispatch({
      post: post,
      actionType: PostConstants.POST_REMOVED
    });
  }
};

module.exports = ServerActions;
