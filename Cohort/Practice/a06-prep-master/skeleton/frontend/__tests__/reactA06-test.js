'use strict';
jest.unmock('../reactA06.jsx');

describe('router', function () {
  var React = require('react'),
      Router = require('react-router').Router,
      ReactDOM = require('react-dom'),
      memoryHistory = require('react-router').createMemoryHistory,
      TestUtils = require('react-addons-test-utils');
  var Entry;

  beforeEach(function () {
    // Mock this function so we can make sure it is called
    document.addEventListener = jest.fn();
    Entry = require('../reactA06.jsx');
  });

  it('sets a listener for the DOMContentLoaded event', function () {
    var eventListenerCalls = document.addEventListener.mock.calls;
    expect(eventListenerCalls.length).toBe(1);
    expect(eventListenerCalls[0][0]).toEqual('DOMContentLoaded');
  });

  it('renders the App component at the root url', function () {
    var node = document.createElement('div');
    var renderedRouter = ReactDOM.render(
      <Router history={memoryHistory("/")} routes={window.routes} />,
      node
    );

    expect(node.textContent).toContain("React/Flux Assessment");
  });

  it('renders the PostIndex as an index route (hint: don\'t forget to render in children!)', function () {
    var PostIndex = require('../components/postIndex.jsx');

    PostIndex.prototype.render.mockImplementation(function () {
      return <div>"PostIndex"</div>;
    });

    var node = document.createElement('div');
    var renderedRouter = ReactDOM.render(
      <Router history={memoryHistory("/")} routes={window.routes} />,
      node
    );

    expect(node.textContent).toContain("PostIndex");
  });

  it('matches \"/posts\" to the PostIndex component', function () {
    var PostIndex = require('../components/postIndex.jsx');

    PostIndex.prototype.render.mockImplementation(function () {
      return <div>"PostIndex"</div>;
    });

    var node = document.createElement('div');
    var renderedRouter = ReactDOM.render(
      <Router history={memoryHistory("/posts")} routes={window.routes} />,
      node
    );

    expect(node.textContent).toContain("PostIndex");
  });

  it('matches \"/posts/:postId\" to the PostShow component', function () {
    var PostShow = require('../components/postShow.jsx');

    PostShow.prototype.render.mockImplementation(function () {
      return <div>"PostShow"</div>;
    });

    var node = document.createElement('div');
    var renderedRouter = ReactDOM.render(
      <Router history={memoryHistory("/posts/1")} routes={window.routes} />,
      node
    );

    expect(node.textContent).toContain("PostShow");
  });

  it('matches \"/posts/:postId/edit\" to the PostEdit component', function () {
    var PostEdit = require('../components/postEdit.jsx');
    PostEdit.prototype.render.mockImplementation(function () {
      return <div>"PostEdit"</div>;
    });

    var node = document.createElement('div');
    var renderedRouter = ReactDOM.render(
      <Router history={memoryHistory("/posts/1/edit")} routes={window.routes} />,
      node
    );

    expect(node.textContent).toContain("PostEdit");
  });
});
