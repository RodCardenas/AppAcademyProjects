'use strict';
jest.unmock('../postForm.jsx')

describe('post form', function () {
  var React = require('react'),
      ReactDOM = require('react-dom'),
      TestUtils = require('react-addons-test-utils');

  var PostForm,
      ClientActions,
      newPost,
      component,
      formNode;

  beforeEach(function () {
    PostForm = require('../postForm.jsx');
    ClientActions = require('../../actions/clientActions.js');

    newPost = {
      id: 1,
      title: "Title",
      body: "Body"
    };

    component = TestUtils.renderIntoDocument(<PostForm />);

    formNode = ReactDOM.findDOMNode(component);
  });

  it('contains title and body fields linked to the component\'s state', function () {
    component.setState({ title: "TestTitle", body: "TestBody" });

    var inputNodes = formNode.querySelector('form').children;
    var inputValues = [];

    for (var i = 0; i < inputNodes.length; i++) {
      if (inputNodes[i].value) {
        inputValues.push(inputNodes[i].value);
      }
    }

    expect(inputValues).toContain("TestTitle");
    expect(inputValues).toContain("TestBody");
  });

  it('triggers the correct action when submitted', function () {
    var form = formNode.querySelector('form');
    TestUtils.Simulate.submit(form);

    var createActionCalls = ClientActions.createPost.mock.calls;
    expect(createActionCalls.length).toBe(1);
  });

  it('updates correctly when the form is changed', function () {
    var form = formNode.querySelector('form');
    var inputNodes = form.childNodes;


    // This simulates typing something into the form
    for (var i = 0; i < inputNodes.length; i++) {
      TestUtils.Simulate.change(inputNodes[i], {
        target: {value: "new value"}
      });
    }

    TestUtils.Simulate.submit(form);

    // Now we check our form submit callback, and make sure that the title and body
    // have actually been updated in our state & that we send the updated title and body
    // to the createPost action

    var createActionArg = ClientActions.createPost.mock.calls[0][0];
    expect(createActionArg).toEqual({
      title: "new value",
      body: "new value"
    });
  });
});
