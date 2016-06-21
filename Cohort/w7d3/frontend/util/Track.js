var KeyActions = require('../actions/KeyActions');

var Track = function(attrs){
  this.name = attrs.name;
  this.roll = attrs.roll || [];
};

Track.prototype.startRecording = function() {
  this.roll = [];
  this.startTime = new Date();
  this.trackLength = 0;
};

Track.prototype.addNotes = function(notes) {
  var timeSlice = new Date() - this.startTime;
  if (notes.length !== 0){
    this.roll.push({notes: notes, timeSlice: timeSlice});
    this.trackLength += timeSlice;
  }
};

Track.prototype.stopRecording = function() {
  this.addNotes([]);
};

Track.prototype.play = function(){
  if (this.interval){
    return;
  }

  var playbackStartTime = Date.now();
  var currentNote = 0;
  var self = this;
  var theTrackLength = this.trackLength;

  this.interval = setInterval(function (){

    // console.log("step one");
    // console.log(["Eq", Date.now() - playbackStartTime]);
    // console.log(["TrackLength", theTrackLength]);

    if (Date.now() - playbackStartTime <= theTrackLength){
      self.roll[currentNote].notes.forEach(function(noteString){
        KeyActions.keyPressed(noteString);
      });

      if (Date.now() - playbackStartTime >= self.roll[currentNote].timeSlice){
        self.roll[currentNote].notes.forEach(function(noteString){
          KeyActions.keyUnPressed(noteString);
        });
        currentNote ++;
      }

    } else {
      clearInterval(self.interval);
      delete(self.interval);
    }

  }, 0);

};

module.exports = Track;
