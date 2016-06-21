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
