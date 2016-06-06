'use strict';
jest.unmock('../postIndexItem.jsx');

describe('post index item', function () {
  var React = require('react'),
      ReactDOM = require('react-dom'),
      TestUtils = require('react-addons-test-utils');

  var PostIndexItem,
      ClientActions,
      post,
      component,
      renderedDOM;

  beforeEach(function () {
    PostIndexItem = require('../postIndexItem.jsx');
    ClientActions = require('../../actions/clientActions');

    post = {
      id: 1,
      title: "Title",
      body: "Body"
    };

    component = TestUtils.renderIntoDocument(
        <PostIndexItem post={post}/>
    );

    renderedDOM = ReactDOM.findDOMNode(component);
  });

  it('shows the post\'s title as a Link to the post\'s show page', function () {
    var showLink = TestUtils.findRenderedDOMComponentWithTag(component, "a");

    expect(showLink).toBeDefined();
    expect(showLink.textContent).toEqual(post.title);
  });

  it('has an button that links to the edit page with text content "Edit"', function () {
    var buttons = TestUtils.scryRenderedDOMComponentsWithTag(component,'button');
    var editButton;

    for (var i = 0; i < buttons.length; i++) {
      if (buttons[i].textContent === "Edit") {
        editButton = buttons[i];
      }
    }

    expect(editButton).toBeDefined();
  });

  it('has a delete button with text content "Delete"', function () {
    var buttons = TestUtils.scryRenderedDOMComponentsWithTag(component,'button');
    var deleteButton;

    for (var i = 0; i < buttons.length; i++) {
      if (buttons[i].textContent === "Delete") {
        deleteButton = buttons[i];
      }
    }

    expect(deleteButton).toBeDefined();
  });

  it('has a delete button that triggers a delete client action when clicked', function () {
    var buttons = TestUtils.scryRenderedDOMComponentsWithTag(component,'button');
    var deleteButton;

    for (var i = 0; i < buttons.length; i++) {
      if (buttons[i].textContent === "Delete") {
        deleteButton = buttons[i];
      }
    }

    TestUtils.Simulate.click(deleteButton);
    expect(ClientActions.deletePost.mock.calls.length).toBe(1);
    expect(ClientActions.deletePost.mock.calls[0][0]).toEqual(post.id);
  });
});
