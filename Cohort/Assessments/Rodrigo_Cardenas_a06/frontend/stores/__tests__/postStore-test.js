'use strict';
jest.unmock('../postStore.js');
jest.unmock('../../constants/postConstants.js');

describe('post store', function () {
  var React = require('react'),
      ReactDOM = require('react-dom'),
      TestUtils = require('react-addons-test-utils'),
      PostConstants = require('../../constants/postConstants');

  var PostStore,
      AppDispatcher,
      callback,
      posts,
      receivePostsAction,
      removePostAction,
      receivePostAction;

  beforeEach(function () {
    AppDispatcher = require('../../dispatcher/dispatcher');
    PostStore = require('../postStore');

    // Avoids invariant violation from __emitChange by making sure isDispatching returns true
    AppDispatcher.isDispatching.mockImplementation(function () {
      return true;
    });

    callback = AppDispatcher.register.mock.calls[0][0];
    // "Give me a reference to the first argument of the first call to MyDispatcher's register() method."
    // https://facebook.github.io/react/blog/2014/09/24/testing-flux-applications.html

    posts = [
      { id: 1, title: "Post1", body: "Body1" },
      { id: 2, title: "Post2", body: "Body2" }
    ];

    receivePostsAction = {
      actionType: PostConstants.POSTS_RECEIVED,
      posts: posts
    };

    receivePostAction = {
      actionType: PostConstants.POST_RECEIVED,
      post: posts[0]
    };

    removePostAction = {
      actionType: PostConstants.POST_REMOVED,
      post: posts[0]
    };
  });

  it('registers a callback with the dispatcher', function() {
    // This is how Facebook checks whether we've registered with AppDispatcher.
    expect(AppDispatcher.register.mock.calls.length).toBe(1);
  });

  it('initializes with no posts (hint: implement PostStore#all)', function () {
    // PostStore#all should initially return an empty array
    expect(PostStore.all().length).toBe(0);
  });

  it('can add many posts to the store', function () {
    callback(receivePostsAction);
    expect(PostStore.all().length).toBe(2);
    expect(PostStore.all()).toEqual(posts);
  });

  it('can add a post to the store', function () {
    callback(receivePostAction);
    var all = PostStore.all();

    expect(all.length).toBe(1);
    expect(all[0].title).toEqual('Post1');
  });

  it('can remove a post from the store', function () {
    callback(receivePostAction);
    callback(removePostAction);

    expect(PostStore.all()).not.toContain(posts[0]);
  });

  it('can find a post by id with #find', function () {
    callback(receivePostsAction);
    var post = PostStore.find(2);

    expect(post.title).toEqual("Post2");
    expect(post.body).toEqual("Body2");
  });
});
