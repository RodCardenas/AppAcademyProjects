var ServerActions = require('../actions/serverActions.js');

module.exports = {
  fetchPosts: function(){
    $.ajax({
      url: "api/posts",
      type: "GET",
      success: function(posts){
        ServerActions.receiveAll();
      }
    });
  },

  getPost: function(id){
    $.ajax({
      url: "api/posts/" + id,
      type: "GET",
      success: function(post){
        ServerActions.receivePost(post);
      }
    });
  },

  createPost: function(data){
    console.log(data);
    $.ajax({
      url: "api/posts",
      type: "POST",
      data: {post:{ body: data.body, title: data.title}},
      success: function(post){
        ServerActions.receivePost(post);
      }
    });
  },

  updatePost: function(data){
    $.ajax({
      url: "api/posts/" + data.id,
      type: "PATCH",
      data: {post:{ body: data.body, title: data.title}},
      success: function(post){
        ServerActions.receivePost(post);
      }
    });
  },

  deletePost: function(id){
    $.ajax({
      url: "api/posts/" + id,
      type: "DELETE",
      success: function(post){
        ServerActions.removePost(post);
      }
    });
  },

};
