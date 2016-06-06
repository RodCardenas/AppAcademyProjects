jest.mock('jquery');
jest.unmock('../apiUtil.js');

describe('the api util', function () {
  var ApiUtil,
      ServerActions;

  beforeEach(function () {
    global.$ = require('jquery');
    ApiUtil = require('../apiUtil.js');
    ServerActions = require('../../actions/serverActions.js');
  });

  it('fetchPosts makes an ajax request that fetches posts', function () {
    ApiUtil.fetchPosts();

    // This line gets the first argument of the first call to $.ajax
    var ajaxCallArg = $.ajax.mock.calls[0][0];
    expect(ajaxCallArg.url).toEqual('api/posts');
  });

  it('on success, fetchPosts ServerActions.receiveAll', function () {
    ApiUtil.fetchPosts();
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    // Trigger the ajax success callback
    ajaxCallArg.success();
    // Make sure that in the success callback, the correct server action is triggered
    expect(ServerActions.receiveAll.mock.calls.length).toBe(1);
  });

  it('getPost makes an ajax request that gets a post', function () {
    ApiUtil.getPost(15);

    var ajaxCallArg = $.ajax.mock.calls[0][0];
    expect(ajaxCallArg.url).toEqual('api/posts/15');
  });

  it('on success, getPost calls ServerActions.receivePost', function () {
    ApiUtil.getPost(15);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    // Trigger the success callback
    ajaxCallArg.success();
    // Make sure that in the success callback, the correct server action is triggered
    expect(ServerActions.receivePost.mock.calls.length).toBe(1);
  });

  it('createPost makes an ajax request that creates a post', function () {
    var post = {title: 'New Post', body: "Content"};
    ApiUtil.createPost(post);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    expect(ajaxCallArg.url).toEqual('api/posts');
    expect([ajaxCallArg.type, ajaxCallArg.method]).toContain("POST");
    expect(ajaxCallArg.data).toEqual({post: post});
  });

  it('on success, createPost calls ServerActions.receivePost', function () {
    var post = {title: 'New Post', body: "Content"};
    ApiUtil.createPost(post);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    ajaxCallArg.success();
    expect(ServerActions.receivePost.mock.calls.length).toBe(1);
  });

  it('updatePost makes an ajax request that updates a post', function () {
    var post = {id: 15, title: 'Existing Post', body: "Content"};
    ApiUtil.updatePost(post);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    expect(ajaxCallArg.url).toEqual('api/posts/15');
    expect([ajaxCallArg.type, ajaxCallArg.method]).toContain("PATCH");
    expect(ajaxCallArg.data).toEqual({
      post: {
        title: post.title,
        body: post.body
      }
    });
  });

  it('on success, updatePost calls ServerActions.receivePost', function () {
    var post = {id: 15, title: 'Existing Post', body: "Content"};
    ApiUtil.updatePost(post);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    ajaxCallArg.success();
    expect(ServerActions.receivePost.mock.calls.length).toBe(1);
  });

  it('deletePost makes an ajax request that deletes a post', function () {
    ApiUtil.deletePost(15);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    expect(ajaxCallArg.url).toEqual('api/posts/15');
    expect([ajaxCallArg.type, ajaxCallArg.method]).toContain("DELETE");
  });

  it('on success, deletePost calls ServerActions.removePost', function () {
    ApiUtil.deletePost(15);
    var ajaxCallArg = $.ajax.mock.calls[0][0];

    ajaxCallArg.success();
    expect(ServerActions.removePost.mock.calls.length).toBe(1);
  });
});
