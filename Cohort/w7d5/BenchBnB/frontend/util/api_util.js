var ServerActions = require ('../actions/server_actions');

var ApiUtil =  {
  fetchBenches: function(bounds){
    $.ajax({
      method: 'GET',
      url: '/api/bench',
      data: bounds,
      success: function(benches){
        ServerActions.receiveAll(benches);
      }
    });
  }
};

module.exports = ApiUtil;
