var ApiUtil = require('../util/apiUtil.js');

module.exports = {
  fetchPosts: function(){
    ApiUtil.fetchPosts();
  },

  getPost: function(id){
    ApiUtil.getPost(id);
  },

  createPost: function(data){
    ApiUtil.createPost(data);
  },

  editPost: function(data){
    ApiUtil.updatePost(data);
  },

  deletePost: function(id){
    ApiUtil.deletePost(id);
  },

};
