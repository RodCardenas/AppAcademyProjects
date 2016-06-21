var React = require('react');
var ReactDOM = require('react-dom');
var Router = require('react-router').Router;
var Route = require('react-router').Route;
var HashHistory = require('react-router').hashHistory;


var PokemonIndex = require('./components/pokemons/pokemonsIndex.jsx');
var PokemonDetail = require('./components/pokemons/pokemonDetail');
// TODO: remove after testing
// apiUtils = require('./util/apiUtil');
// ClientActions = require('./actions/clientActions');
// PokemonStore = require('./stores/pokemon');


var App = React.createClass({
  render: function(){
    return (
      <div id="pokedex">
        {this.props.children}
        <div className="pokemon-index-pane">
          <PokemonIndex />
        </div>
      </div>
    );
  }
});

var routes = (
  <Route path="/" component={App}>
    <Route path="pokemon/:pokemonId" component={PokemonDetail}/>
  </Route>
  );
  // route creates route params for the rendered component to access
  // through its props. 

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(
    <Router history={HashHistory}>{routes}</Router>,
    document.getElementById('root'));
});
