'use strict';
jest.unmock('../postEdit.jsx');
jest.mock('react-router');

describe('post edit', function () {
  var React = require('react'),
      ReactDOM = require('react-dom'),
      ReactRouter = require('react-router'),
      TestUtils = require('react-addons-test-utils');

  var PostEdit,
      PostStore,
      ClientActions,
      component,
      postEditNode,
      post,
      fakeParams;

  beforeEach(function () {
    PostEdit = require('../postEdit.jsx');
    PostStore = require('../../stores/postStore.js');
    ClientActions = require('../../actions/clientActions.js');

    post = {
      id: 1,
      title: "Title",
      body: "Body"
    };


    PostStore.find.mockImplementation(function (id) {
      if (id === post.id) {
        return post;
      }
    });

    fakeParams = { postId: post.id };

    component = TestUtils.renderIntoDocument(
        <PostEdit params={fakeParams} />
    );

    postEditNode = ReactDOM.findDOMNode(component);
  });

  it('contains title and body fields linked to the component\'s state', function () {
    component.setState({ title: "TestTitle", body: "TestBody" });

    var inputNodes = postEditNode.querySelector('form').children;
    var inputValues = [];

    for (var i = 0; i < inputNodes.length; i++) {
      if (inputNodes[i].value) {
        inputValues.push(inputNodes[i].value);
      }
    }

    expect(inputValues).toContain("TestTitle");
    expect(inputValues).toContain("TestBody");
  });

  it('prefills post data from the store', function () {
    var findPostCall = PostStore.find.mock.calls[0][0];
    expect(findPostCall).toBe(post.id);

    var inputNodes = postEditNode.querySelector('form').childNodes;
    var inputValues = [];

    for (var i = 0; i < inputNodes.length; i++) {
      if (inputNodes[i].value) {
        inputValues.push(inputNodes[i].value);
      }
    }

    expect(inputValues).toContain("Title");
    expect(inputValues).toContain("Body");
  });

  it('triggers the correct action when submitted', function () {
    var form = postEditNode.querySelector('form');
    TestUtils.Simulate.submit(form);

    var editActionCalls = ClientActions.editPost.mock.calls;
    expect(editActionCalls.length).toBe(1);
  });

  it('updates correctly when the form is changed', function () {
    var form = postEditNode.querySelector('form');
    var inputNodes = form.childNodes;


    // This simulates typing something into the form
    for (var i = 0; i < inputNodes.length; i++) {
      TestUtils.Simulate.change(inputNodes[i], {target: {value: "new value"}});
    }

    TestUtils.Simulate.submit(form);

    // Now we check our form submit callback, and make sure that the title and body
    // have actually been updated in our state & that we send the updated title and body
    // to the editPost action

    var editActionArg = ClientActions.editPost.mock.calls[0][0];
    expect(editActionArg).toEqual({
      title: "new value",
      body: "new value",
      id: 1
    });
  });
  
});
