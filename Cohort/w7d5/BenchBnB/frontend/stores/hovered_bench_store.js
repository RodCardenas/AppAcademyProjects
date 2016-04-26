var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher');
var BenchConstants = require('../constants/bench_constants');

var _hoveredBench = {};
var HoveredBenchStore = new Store(AppDispatcher);


HoveredBenchStore.hoveredBench = function () {
  return Object.assign({}, _hoveredBench);
};

var resetHoveredBench = function(bench){
  _hoveredBench = bench;
  return;
};

HoveredBenchStore.__onDispatch = function (payload) {
  switch(payload.actionType) {
    case BenchConstants.BENCH_HOVERED:
      resetHoveredBench(payload.bench);
      HoveredBenchStore.__emitChange();
      break;
  }
};

module.exports = HoveredBenchStore;
