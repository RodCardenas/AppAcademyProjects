var React = require('react'),
    ReactDOM = require('react-dom'),
    KeyListener = require('./util/KeyListener'),
    Organ = require('./components/organ');

KeyListener();

document.addEventListener('DOMContentLoaded', function(){
  ReactDOM.render(
    React.createElement(Organ, {}),
    document.getElementById('content')
  );
}, false);
