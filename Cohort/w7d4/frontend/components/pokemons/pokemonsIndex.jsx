var React = require ('react'),
    PokemonStore = require ('../../stores/pokemon'),
    PokemonIndexItem = require ('./pokemonIndexItem'),
    ClientActions = require('../../actions/clientActions.js');


var PokemonsIndex = React.createClass({
  getInitialState: function(){
    return {pokemons: PokemonStore.all()};
  },

  componentDidMount: function(){
    this.listener = PokemonStore.addListener(this._onChange);
    ClientActions.fetchAllPokemons();
  },

  componentWillUnmount: function(){
    this.listener.remove();
  },

  _onChange: function(){
    this.setState({pokemons: PokemonStore.all()});
  },

  render: function() {
    var pokemonListItems = this.state.pokemons.map( function(pokemon) {
      return (<PokemonIndexItem key={pokemon.id} pokemon={pokemon} />);
    });

    return (
      <ul>
        {pokemonListItems}
      </ul>
    );
  }


});

module.exports = PokemonsIndex;
