var Game = require("./game");
var GameView = require("./gameView");

document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementsByTagName("canvas")[0];
  canvas.width = Game.DIM_X;
  canvas.height = Game.DIM_Y;

  var ctx = canvas.getContext("2d");
  var game = new Game();
  new GameView(game, ctx).start();
});
