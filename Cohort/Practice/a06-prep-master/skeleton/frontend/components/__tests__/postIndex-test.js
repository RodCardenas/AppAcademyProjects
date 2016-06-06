'use strict';
jest.unmock('../postIndex.jsx');

describe('post index', function () {
  var React = require('react'),
      ReactDOM = require('react-dom'),
      TestUtils = require('react-addons-test-utils');

  var PostStore,
      PostIndex,
      PostForm,
      PostIndexItem,
      ClientActions,
      posts,
      component,
      indexNode;

  beforeEach(function () {
    PostStore = require('../../stores/postStore.js');
    PostForm = require('../postForm.jsx');
    ClientActions = require('../../actions/clientActions.js');
    PostIndex = require('../postIndex.jsx');
    PostIndexItem = require('../postIndexItem.jsx');

    posts = [
      { id: 1, title: "Title1" },
      { id: 2, title: "Title2" },
      { id: 3, title: "Title3" }
    ];

    component = TestUtils.renderIntoDocument(<PostIndex />);
    indexNode = ReactDOM.findDOMNode(component);

    PostStore.all.mockImplementation(function () {
      return posts;
    });
  });

  it('adds a listener to the PostStore', function () {
    var postStoreListenerCalls = PostStore.addListener.mock.calls;
    expect(postStoreListenerCalls.length).toBe(1);
  });

  it('fetches all the posts when it mounts', function () {
    var clientActionFetchCalls = ClientActions.fetchPosts.mock.calls;
    expect(clientActionFetchCalls.length).toBe(1);
  });

  it('sets its state to all the posts in the post store when the store changes', function () {
    // This is the function we pass as a callback to our post store listener
    var postStoreListenerCallback = PostStore.addListener.mock.calls[0][0];
    postStoreListenerCallback();

    expect(component.state.posts).toEqual(posts);
  });

  it('renders a post index item for each post', function () {
    component.setState({ posts: posts });
    expect(PostIndexItem.mock.instances.length).toBe(3);

    // These are the props passed in when we create post index item
    var props = PostIndexItem.prototype.constructor.mock.calls[0][0];
    expect(props.post).toBe(posts[0]);
  });

  it('contains a form to create new posts', function () {
    expect(PostForm.mock.instances.length).toBe(1);
  });
});
