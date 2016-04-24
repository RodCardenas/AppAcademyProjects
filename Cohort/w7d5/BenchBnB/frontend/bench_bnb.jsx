var ReactDOM = require('react-dom');
var React = require('react');
ApiUtil = require('./util/api_util');

document.addEventListener('DOMContentLoaded', function(){
  ReactDOM.render(
    React.createElement(<div> hi </div>, {}), 
    document.getElementById('root'));
});
