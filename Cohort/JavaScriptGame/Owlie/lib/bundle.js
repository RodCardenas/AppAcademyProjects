/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var Game = __webpack_require__(1);
	var GameView = __webpack_require__(5);
	
	document.addEventListener("DOMContentLoaded", function(){
	  var canvas = document.getElementsByTagName("canvas")[0];
	  canvas.width = Game.DIM_X;
	  canvas.height = Game.DIM_Y;
	
	  var ctx = canvas.getContext("2d");
	  var game = new Game();
	  new GameView(game, ctx).start();
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var Owl = __webpack_require__(2);
	
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


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	var Util = __webpack_require__(3);
	var MovingObject = __webpack_require__(4);
	
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


/***/ },
/* 3 */
/***/ function(module, exports) {

	var Util = {
	  // Normalize the length of the vector to 1, maintaining direction.
	  dir: function (vec) {
	    var norm = Util.norm(vec);
	    return Util.scale(vec, 1 / norm);
	  },
	  // Find distance between two points.
	  dist: function (pos1, pos2) {
	    return Math.sqrt(
	      Math.pow(pos1[0] - pos2[0], 2) + Math.pow(pos1[1] - pos2[1], 2)
	    );
	  },
	  // Find the length of the vector.
	  norm: function (vec) {
	    return Util.dist([0, 0], vec);
	  },
	  // Return a randomly oriented vector with the given length.
	  randomVec : function (length) {
	    var deg = 2 * Math.PI * Math.random();
	    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
	  },
	  // Scale the length of a vector by the given amount.
	  scale: function (vec, m) {
	    return [vec[0] * m, vec[1] * m];
	  },
	  
	  inherits: function (ChildClass, BaseClass) {
	    function Surrogate () { this.constructor = ChildClass; }
	    Surrogate.prototype = BaseClass.prototype;
	    ChildClass.prototype = new Surrogate();
	  },
	};
	
	module.exports = Util;


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	var Util = __webpack_require__(3);
	
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


/***/ },
/* 5 */
/***/ function(module, exports) {

	var GameView = function (game, ctx) {
	  this.ctx = ctx;
	  this.game = game;
	  this.owl = this.game.owl;
	};
	
	GameView.prototype.start = function () {
	  this.lastTime = 0;
	  //start the animation
	  requestAnimationFrame(this.animate.bind(this));
	};
	
	GameView.prototype.animate = function(time){
	  var timeDelta = time - this.lastTime;
	
	  this.game.draw(this.ctx);
	  this.lastTime = time;
	
	  //every call to animate requests causes another call to animate
	  requestAnimationFrame(this.animate.bind(this));
	};
	
	module.exports = GameView;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map