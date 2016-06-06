import { Router, Route, IndexRoute, Link, hashHistory } from 'react-router'

var React = require('react'),
    ReactDOM = require('react-dom'),
    PostIndex = require('./components/postIndex.jsx'),
    PostShow = require('./components/postShow.jsx'),
    PostEdit = require('./components/postEdit.jsx');

var App = React.createClass({
  render: function () {
    return (
      <div>
        <h1>React/Flux Assessment</h1>
        {this.props.children}
      </div>
    );
  }
});

// add your routes here
var routes = (
  <Route path="/" component={App}>
    <IndexRoute component={PostIndex} />
    <Route path="/posts" component={PostIndex} />
    <Route path="/posts/:postId" component={PostShow} />
    <Route path="/posts/:postId/edit" component={PostEdit} />
  </Route>
);

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(
    <Router history={hashHistory} routes={routes} />, document.getElementById('content')
  );
});
// do not remove or rename routes, for testing purposes
window.routes = routes;
