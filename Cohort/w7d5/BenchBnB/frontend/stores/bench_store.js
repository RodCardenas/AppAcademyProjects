var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher');
var BenchConstants = require('../constants/bench_constants');

var _benches = {};
var BenchStore = new Store(AppDispatcher);

BenchStore.all = function () {
  return Object.assign({}, _benches);
};

var resetBenches = function(benches){
  _benches = {};
  for (var i = 0; i < benches.length; i++) {
    _benches[benches[i].id] = benches[i];
  }
  return;
};

BenchStore.__onDispatch = function (payload) {
  switch(payload.actionType) {
    case BenchConstants.BENCHES_RECEIVED:
      resetBenches(payload.benches);
      BenchStore.__emitChange();
      break;
  }
};

module.exports = BenchStore;
