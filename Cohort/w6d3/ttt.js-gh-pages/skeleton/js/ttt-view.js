var View = function (game, $el) {
  this.game = game;
  this.board = $el;
};

View.prototype.bindEvents = function () {
  var view = this;
  $(".ttt").on("click", "li", function(e){
    var $currentElement = $(e.currentTarget);
    try {
      view.makeMove($currentElement);
    } catch (err) {
      alert("Invalid move!!!");
    }
  });
};

View.prototype.makeMove = function ($square) {
  var pos = $square.attr("data-pos");
  pos = pos.split(",");
  pos = pos.map(function(el){
    return parseInt(el);
  });

  var mark = this.game.playMove(pos);
  $square.text(mark);
  $square.addClass("clicked");

  if (this.game.isOver()){
    alert(mark + "'s Win!");
    $(".ttt").off("click");
    $("*").addClass("gameover");
  }
};

View.prototype.setupBoard = function () {
  for(var i = 0; i < 3; i++){
    this.board.append("<ul class='row' data-row='"+i+"'></ul>");
    for (var j = 0; j < 3; j++) {
      $("ul[data-row="+i+"]").append("<li class='col' data-pos='"+[i,j]+"'></li>");
    }
  }
};

module.exports = View;
