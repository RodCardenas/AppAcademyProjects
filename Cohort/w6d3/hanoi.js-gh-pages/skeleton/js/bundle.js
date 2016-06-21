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
/******/ 	__webpack_require__.p = "/js/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var HanoiView = __webpack_require__(1);
	var HanoiGame = __webpack_require__(2);
	
	$(function () {
	  var rootEl = $('.hanoi');
	  var game = new HanoiGame();
	  var view = new HanoiView(game,rootEl);
	
	  view.setupTowers();
	  view.bindEvents();
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	var HanoiView = function(game, $el){
	  this.game = game;
	  this.board = $el;
	  this.firstclick = null;
	};
	
	HanoiView.prototype.setupTowers = function () {
	  for(var i = 0; i < 3; i++){
	    this.board.append("<ul class='row' data-row='"+i+"'></ul>");
	    for (var j = 2; j >= 0 ; j--) {
	      $("ul[data-row="+i+"]")
	        .append("<li class='col' data-pos='"+[i,j]+"'></li>");
	    }
	  }
	  this.render();
	};
	
	HanoiView.prototype.render = function () {
	  //alter the shit
	  $("li").removeClass("disk-1");
	  $("li").removeClass("disk-2");
	  $("li").removeClass("disk-3");
	
	  this.game.towers.forEach(function(tower, row){
	    tower.forEach(function(disc, col){
	      $("li[data-pos='"+[row,col]+"']").addClass("disk-" + disc);
	    });
	  });
	};
	
	HanoiView.prototype.bindEvents = function () {
	  var view = this;
	  $(".hanoi").on("click", "ul", function(e){
	    var $currentElement = $(e.currentTarget);
	    if(!view.firstclick){
	      view.firstclick = $currentElement;
	      $currentElement.addClass("selected");
	    } else{
	      $currentElement.addClass("selected");
	      view.makeMove(view.firstclick, $currentElement);
	      view.firstclick.removeClass("selected");
	      $currentElement.removeClass("selected");
	      view.firstclick = null;
	    }
	  });
	};
	
	HanoiView.prototype.makeMove = function ($startTower, $endTower) {
	  var fromTower = parseInt($startTower.attr("data-row"));
	  var toTower = parseInt($endTower.attr("data-row"));
	  console.log(fromTower);
	  console.log(toTower);
	
	  if(!this.game.move(fromTower,toTower)){
	    alert("Invalid move!!!");
	  }
	  this.render();
	  if(this.game.isWon()){
	    alert("you win! gg");
	    $(".hanoi").off("click");
	  }
	};
	
	module.exports = HanoiView;


/***/ },
/* 2 */
/***/ function(module, exports) {

	function Game () {
	  this.towers = [[3, 2, 1], [], []];
	};
	
	Game.prototype.isValidMove = function (startTowerIdx, endTowerIdx) {
	  var startTower = this.towers[startTowerIdx];
	  var endTower = this.towers[endTowerIdx];
	
	  if (startTower.length === 0) {
	    return false;
	  } else if (endTower.length == 0) {
	    return true;
	  } else {
	    var topStartDisc = startTower[startTower.length - 1];
	    var topEndDisc = endTower[endTower.length - 1];
	    return topStartDisc < topEndDisc;
	  }
	};
	
	Game.prototype.isWon = function () {
	  // move all the discs to the last or second tower
	  return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	};
	
	Game.prototype.move = function (startTowerIdx, endTowerIdx) {
	  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	    this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	    return true;
	  } else {
	    return false;
	  }
	};
	
	Game.prototype.print = function () {
	  console.log(JSON.stringify(this.towers));
	};
	
	Game.prototype.promptMove = function (reader, callback) {
	  this.print();
	  reader.question("Enter a starting tower: ", function (start) {
	    var startTowerIdx = parseInt(start);
	    reader.question("Enter an ending tower: ", function (end) {
	      var endTowerIdx = parseInt(end);
	      callback(startTowerIdx, endTowerIdx)
	    });
	  });
	};
	
	Game.prototype.run = function (reader, gameCompletionCallback) {
	  this.promptMove(reader, (function (startTowerIdx, endTowerIdx) {
	    if (!this.move(startTowerIdx, endTowerIdx)) {
	      console.log("Invalid move!");
	    }
	
	    if (!this.isWon()) {
	      // Continue to play!
	      this.run(reader, gameCompletionCallback);
	    } else {
	      this.print();
	      console.log("You win!");
	      gameCompletionCallback();
	    }
	  }).bind(this));
	};
	
	module.exports = Game;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map