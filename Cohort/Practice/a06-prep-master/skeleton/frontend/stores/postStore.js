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
  for (var i = 0; i < posts.length; i++) {
    _posts.push(posts[i]);
  }
};

var addPost = function(post){
  _posts.push(post);
};

var removePost = function(post){
  _posts.splice(_posts.indexOf(post),1);
};

PostStore.__onDispatch = function(payload){
  switch (payload.actionType){
    case PostConstants.POSTS_RECEIVED:
    addPosts(payload.posts);
    PostStore.__emitChange();
    break;

    case PostConstants.POST_RECEIVED:
    addPost(payload.post);
    PostStore.__emitChange();
    break;

    case PostConstants.POST_REMOVED:
    removePost(payload.post);
    PostStore.__emitChange();
    break;
  }
};

module.exports = PostStore;
