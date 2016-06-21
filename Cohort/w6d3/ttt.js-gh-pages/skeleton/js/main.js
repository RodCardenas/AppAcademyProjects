var View = require('./ttt-view');
var Game = require('../../ttt-core-solution/game');

$(function () {
  // Your code here
  var game = new Game();
  var $board = $(".ttt");
  var view = new View(game, $board);
  view.setupBoard();
  view.bindEvents();
});
