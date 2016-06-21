function Clock () {
  // 1. Create a Date object.
  // 2. Store the hours, minutes, and seconds.
  // 3. Call printTime.
  // 4. Schedule the tick at 1 second intervals.

  var today =  new Date();
  this.hours = today.getHours();
  this.minutes =  today.getMinutes();
  this.seconds = today.getSeconds();

  this.printTime();
  setInterval(this._tick.bind(this), 1000);
}

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  // Use console.log to print it.
  console.log(this.hours + ":" + this.minutes + ":" + this.seconds);
};

Clock.prototype._tick = function () {
  // 1. Increment the time by one second.
  // 2. Call printTime.
  if (this.seconds < 59) {
    this.seconds += 1;
  }
  else {
    this.seconds = 0;
    if (this.minutes < 59) {
      this.minutes += 1;
    }
    else {
      this.hours += 1;
      this.minutes = 0;
    }
  }

  this.printTime();
};

var clock = new Clock();
console.log(clock);
