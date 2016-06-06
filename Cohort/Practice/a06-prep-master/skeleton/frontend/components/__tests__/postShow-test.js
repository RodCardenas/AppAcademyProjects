'use strict';
jest.unmock('../postShow.jsx');

describe('post show', function () {
  var React = require('react'),
      ReactDOM = require('react-dom'),
      TestUtils = require('react-addons-test-utils');

  var PostShow,
      PostStore,
      ClientActions,
      post,
      postShowNode,
      component;

  beforeEach(function () {
    PostShow = require('../postShow.jsx');
    PostStore = require('../../stores/postStore.js');
    ClientActions = require('../../actions/clientActions.js');

    post = {
      id: 1,
      title: "Title",
      body: "Body"
    };

    var fakeParams = { postId: post.id };

    component = TestUtils.renderIntoDocument(
        <PostShow params={fakeParams}/>
    );

    postShowNode = ReactDOM.findDOMNode(component);

    // We mock the PostStore's find function so it will return the correct post
    // to us.
    PostStore.find.mockImplementation(function (id) {
      if (id === post.id) {
        return post;
      }
    });
  });

  it('contains the post information', function () {
    component.setState({post: post});
    var renderedText = postShowNode.textContent;

    expect(renderedText).toContain(post.title);
    expect(renderedText).toContain(post.body);
  });

  it('listens to the post store', function () {
    expect(PostStore.addListener).toBeCalled();
    expect(ClientActions.getPost).toBeCalledWith(post.id);
  });

  it('finds the correct post from the store and sets the component\'s state when the post store changes', function () {
    // This gets the first argument of the first call to PostStore.addListener,
    // which should be a function that finds the correct post from the store and
    // sets the component's state to that post.
    var callback = PostStore.addListener.mock.calls[0][0];

    // We call it to simulate the listener triggering
    callback();

    expect(PostStore.find).toBeCalledWith(post.id);
    expect(component.state.post).toEqual(post);
  });
});
