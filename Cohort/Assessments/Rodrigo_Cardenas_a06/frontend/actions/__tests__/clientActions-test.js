jest.unmock('../clientActions.js');

describe('client actions', function () {
  var ClientActions,
      ApiUtil,
      post;

  beforeEach(function () {
    ApiUtil = require('../../util/apiUtil.js');
    ClientActions = require('../clientActions.js');

    post = {
      title: 'Some Post',
      body: 'It\'s a post alright!'
    };
  });

  it('fetchPosts makes a call to ApiUtil.fetchPosts', function () {
    ClientActions.fetchPosts();
    expect(ApiUtil.fetchPosts.mock.calls.length).toEqual(1);
  });

  it('getPost makes a call to ApiUtil.getPost', function () {
    ClientActions.getPost(15);
    expect(ApiUtil.getPost.mock.calls.length).toEqual(1);

    // This says that we expect the ApiUtil.getPost to be called with 15 as an arg
    expect(ApiUtil.getPost.mock.calls[0][0]).toEqual(15);
  });

  it('createPost makes a call to ApiUtil.createPost', function () {
    ClientActions.createPost(post);
    expect(ApiUtil.createPost.mock.calls.length).toEqual(1);
    expect(ApiUtil.createPost.mock.calls[0][0]).toEqual(post);
  });

  it('editPost makes a call to ApiUtil.updatePost', function () {
    ClientActions.editPost(post);
    expect(ApiUtil.updatePost.mock.calls.length).toEqual(1);
    expect(ApiUtil.updatePost.mock.calls[0][0]).toEqual(post);
  });

  it('deletePost makes a call to ApiUtil.deletePost', function () {
    ClientActions.deletePost(15);
    expect(ApiUtil.deletePost.mock.calls.length).toEqual(1);
    expect(ApiUtil.deletePost.mock.calls[0][0]).toEqual(15);
  });
});
