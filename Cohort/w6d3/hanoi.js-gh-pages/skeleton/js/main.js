var HanoiView = require('./view');
var HanoiGame = require('../../hanoi-core-solution/game');

$(function () {
  var rootEl = $('.hanoi');
  var game = new HanoiGame();
  var view = new HanoiView(game,rootEl);

  view.setupTowers();
  view.bindEvents();
});
