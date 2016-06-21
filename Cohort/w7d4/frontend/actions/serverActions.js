var AppDispatcher = require('../dispatcher/dispatcher.js');
var PokemonConstants = require('../constants/pokemonConstants.js');

module.exports = {
  receiveAllPokemons: function(pokemons) {
    AppDispatcher.dispatch({
      actionType: PokemonConstants.POKEMONS_RECEIVED,
      pokemons: pokemons
    });
  },

  receivePokemon: function(pokemon) {
    AppDispatcher.dispatch({
      actionType: PokemonConstants.POKEMON_RECEIVED,
      pokemon: pokemon
    });
  }
};
