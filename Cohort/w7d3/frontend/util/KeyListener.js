var KeyActions = require('../actions/KeyActions');

var keys = [];

var KeyListener = function(){
  $(document).keydown(function(event){
    var noteString = Mapping[event.keyCode];
    if(keys.indexOf(noteString) === -1 ){
      console.log("Keydown: " + noteString);
      keys.push(noteString);
      KeyActions.keyPressed(noteString);
    }

  });

  $(document).keyup(function(event){
    var noteString = Mapping[event.keyCode];
    // console.log(noteString + " unpressed");
    keys.splice(keys.indexOf(noteString), 1);
    KeyActions.keyUnPressed(noteString);
  });
};

var Mapping = {
  67: 'C4',
  68: 'D4',
  69: 'E4',
  70: 'F4',
  71: 'G4',
  65: 'A4'
};

module.exports = KeyListener;
