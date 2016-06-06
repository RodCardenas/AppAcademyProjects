var Util = require("./util");

var MovingObject = function (options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.game = options.game;
  this.imgSrc = options.imgSrc;
  this.width = options.width;
  this.height = options.height;
};

MovingObject.prototype.draw = function (ctx) {
  var img = new Image();

  img.onload = function () {
    ctx.drawImage(img, 100, 100);
  };

  img.src = this.imgSrc;
};

module.exports = MovingObject;
