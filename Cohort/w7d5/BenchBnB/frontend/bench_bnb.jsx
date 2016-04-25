var ReactDOM = require('react-dom');
var React = require('react');
ApiUtil = require('./util/api_util');
store = require('./stores/bench_store.js');

document.addEventListener('DOMContentLoaded', function(){
  ReactDOM.render(
    // React.createElement(<div> hi </div>, {}),
    React.createElement('div'),
    document.getElementById('root'));
});
