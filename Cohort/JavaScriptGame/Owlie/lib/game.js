var Owl = require("./owl");

var Game = function () {
  this.owl = new Owl({ game: this });
  this.setupHandlers();
};

Game.BG_COLOR = "#000000";
Game.DIM_X = 1000;
Game.DIM_Y = 600;

Game.prototype.setupHandlers = function () {
  var self = this;
  document.onkeydown = function(evt) {
    console.log(evt);
    evt = evt || window.event;

    //Handle space press
    if (evt.keyCode === 32 || evt.code === "Space"){
        self.owl.shootFire();
    }
  };
};

Game.prototype.draw = function (ctx) {
  // ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  // ctx.fillStyle = Game.BG_COLOR;
  // ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.owl.draw(ctx);
};

module.exports = Game;
