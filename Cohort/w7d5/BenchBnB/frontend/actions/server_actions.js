var AppDispatcher = require('../dispatcher/dispatcher');
var BenchConstants = require('../constants/bench_constants');

module.exports = {
  receiveAll: function(benches){
    AppDispatcher.dispatch({
      actionType: BenchConstants.BENCHES_RECEIVED,
      benches: benches
    });
  },

  benchHoverEvent: function(bench){
    AppDispatcher.dispatch({
      actionType: BenchConstants.BENCH_HOVERED,
      bench: bench
    });
  }
};
