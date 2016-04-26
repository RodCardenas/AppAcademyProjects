var React = require('react');
var ServerActions = require('../actions/server_actions');
var BenchStore = require('../stores/bench_store.js');

var Index = React.createClass({

  getInitialState: function(){
    return ({ benches: BenchStore.all() });
  },

  componentDidMount: function(){
    this.listenerToken = BenchStore.addListener(this._onChange);
  },

  componentWillUnmount: function(){
    this.listenerToken.remove();
  },

  _onChange: function(){
    this.setState({ benches: BenchStore.all() });
  },

  _handleHover: function(bench){
    ServerActions.benchHoverEvent(bench);
  },

  render: function(){
    var keys = Object.keys(this.state.benches);

    if( keys.length !== 0 ){
      var benches = keys.map(function(benchId){
        var bench = this.state.benches[benchId];

        return (
          <li
            key={benchId} onMouseOver={this._handleHover.bind(this, bench)} bench={bench}>{bench.description}
          </li>
        );

      }.bind(this));
    } else {
      benches = "-";
    }

    return (
      <ul>{benches}</ul>
    );
  }
});

module.exports = Index;
