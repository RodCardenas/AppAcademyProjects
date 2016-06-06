var Store = require('flux/utils').Store;
var PostConstants = require('../constants/postConstants.js');
var AppDispatcher = require('../dispatcher/dispatcher.js');

var PostStore = new Store(AppDispatcher);

var _posts = [];

PostStore.all = function(){
  return _posts.slice();
};

PostStore.find = function(id){
  for (var i = 0; i < _posts.length; i++) {
    if (_posts[i].id === id){
      return _posts[i];
    }
  }
};

var addPosts = function(posts){
  _posts = posts;
};

var addPost = function(post){
  _posts.push(post);
};

var removePost = function(post){
  _posts.splice(_posts.indexOf(post),1);
};

PostStore.__onDispatch = function(payload){
  switch (payload.actionType) {
    case PostConstants.POSTS_RECEIVED:
      addPosts(payload.posts);
      break;

    case PostConstants.POST_RECEIVED:
      addPost(payload.post);
      break;

    case PostConstants.POST_REMOVED:
      removePost(payload.post);
      break;
  }
};

module.exports = PostStore;
