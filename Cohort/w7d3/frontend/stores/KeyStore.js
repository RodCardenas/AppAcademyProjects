var AppDispatcher = require('../dispatcher/dispatcher.js'),
    Store = require('flux/utils').Store;

var KeyStore = new Store(AppDispatcher);

var _keys = [];
// var _keys = {};

var addNote = function(noteString){
  // if(_keys.indexOf(noteString) === -1 ){
    _keys.push(noteString);
    KeyStore.__emitChange();
  // }
  // _keys[
  console.log("Now Playing : " + _keys);
};

var removeNote = function(noteString){
  _keys.splice(_keys.indexOf(noteString), 1);
  KeyStore.__emitChange();
  // console.log("remove: " + _keys);
};

KeyStore.all = function(){
  return _keys.slice();
};

KeyStore.__onDispatch = function(payload){
  switch(payload.actionType){
    case 'ADD':
      addNote(payload.note);
      console.log("Adding: " + _keys);
      break;

    case 'REMOVE':
      removeNote(payload.note);
      // console.log(_keys);
      break;
  }
};

module.exports = KeyStore;
