var Util = require("./util");
var MovingObject = require("./movingObject");

var DEFAULTS = {
	RADIUS: 100,
	SPEED: 2
};

var Owl = function (options) {
  options = options || {};
  options.pos = options.pos || [0,0];
  options.radius = DEFAULTS.RADIUS;
  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
  options.imgSrc = "img/owlie.png";
  options.width = 100;
  options.height = 100;
  MovingObject.call(this, options);
};

Owl.prototype.shootFire = function () {
  var options = {};
  options.pos = [0,0];
  options.radius = DEFAULTS.RADIUS / 2;
  options.vel = Util.randomVec(DEFAULTS.SPEED);
  options.imgSrc = "img/fireball_0.png";
  options.width = 50;
  options.height = 50;
  MovingObject.call(this, options);
};

Util.inherits(Owl, MovingObject);

Owl.prototype.type = "Owl";

module.exports = Owl;
