var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

Hanoi.prototype.run = function () {
  // UNtil disks are on the last stack do
    // prompt for stack to take from
    // prompt for stack to move to
    // do the move
    // render state
    // loop
    // console.log(this.isWon);

    if (!this.isWon()) {
      this.promptMove(this.move.bind(this));
    } else{
      console.log("You Win!");
      reader.close();
    }
};

function Hanoi(){
  this.stacks = [[3,2,1],[],[]];
  this.fromStack = undefined;
  this.toStack = undefined;

  this.promptMove = function (callback){
    this.print();
    reader.question(
      "Enter from stack and to stack: (fromStack,toStack)", function(ans) {
      var ansArr = ans.split(',');
      callback(ansArr[0] - 1,ansArr[1] - 1);
    });
  };

  this.isValidMove = function (from, to){
    if ((from > this.stacks.length || from < 0) ||
          (to > this.stacks.length || to < 0)) {
      return false;
    }else if(this.stacks[from].length < 1){
      return false;
    }else{
      var fDisk = this.stacks[from][this.stacks[from].length - 1];
      var tDisk = this.stacks[to][this.stacks[to].length - 1];

      if ((fDisk > tDisk) && (tDisk !== undefined)){
        return false;
     }
    }
    return true;
  };

  this.move = function(from, to) {
    if (this.isValidMove(from, to)) {
      this.stacks[to].push(this.stacks[from].pop(1));
    }
    this.run();
  };

  this.isWon = function() {
    if (this.stacks[2].length === 3 || this.stacks[1].length === 3) {
      return true;
    }
    return false;
  };

  this.print = function (){
    console.log(this.stacks);
  };

  // this.print = function (){
  //   stacks.forEach(function(arr){
  //     arr.forEach(function (el){
  //       console.log(el);
  //     });
  //   });
  // };
}

var h = new Hanoi();
h.run(h.run.bind(h));
