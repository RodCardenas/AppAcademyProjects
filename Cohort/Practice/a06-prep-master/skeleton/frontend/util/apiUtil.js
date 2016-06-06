var ServerActions = require('../actions/serverActions.js');

module.exports = {
  fetchPosts: function(){
    $.ajax({
      type: "GET",
      url:"api/posts",
      success: function(posts){
        ServerActions.receiveAll(posts);
      }
    });
  },

  getPost: function(id){
    $.ajax({
      type: "GET",
      url:"api/posts/" + id,
      success: function(post){
        ServerActions.receivePost(post);
      }
    });
  },

  createPost: function(data){
    $.ajax({
      type: "POST",
      url:"api/posts",
      data: { post: data },
      success: function(post){
        ServerActions.receivePost(post);
      }
    });
  },

  updatePost: function(data){
    $.ajax({
      type: "PATCH",
      url:"api/posts/" + data.id,
      data: {post: { body: data.body, title: data.title }},
      success: function(post){
        ServerActions.receivePost(post);
      }
    });
  },

  deletePost: function(id){
    $.ajax({
      type: "DELETE",
      url:"api/posts/" + id,
      success: function(post){
        ServerActions.removePost(post);
      }
    });
  },
};
