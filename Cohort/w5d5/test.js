// var readline = require('readline');
//
// var reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// reader.question("What is your name?", function (answer) {
//   console.log("Hello " + answer + "!");
//
//   // Close the reader, which will allow the program to end because it
//   // is no longer waiting for any events.
//   reader.close();
// });


function Clock () {
  // 1. Create a Date object.
  // 2. Store the hours, minutes, and seconds.
  // 3. Call printTime.
  // 4. Schedule the tick at 1 second intervals.

  this.today =  new Date();
  this.hrs = this.today.getHours();
  this.minutes =  this.today.getMinutes();
  this.seconds = this.today.getSeconds();
}

Clock.prototype.printTime = function () {

};

Clock.prototype._tick = function () {
  this.seconds += 1;

};

var clock = new Clock();
console.log(clock);
console.log(clock.prototype);
