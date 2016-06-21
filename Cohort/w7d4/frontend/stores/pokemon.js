var Store = require ('flux/utils').Store,
    AppDispatcher = require ('../dispatcher/dispatcher.js'),
    PokemonStore = new Store(AppDispatcher),
    PokemonConstants = require('../constants/pokemonConstants.js');

var _pokemons = {};

var resetPokemons = function(pokemons){
  _pokemons = {};

  pokemons.forEach(function(pokemon){
    _pokemons[pokemon.id] = pokemon;
  });

  PokemonStore.__emitChange();
};

var resetPokemon = function(pokemon){
  _pokemons[pokemon.id] = pokemon;

  PokemonStore.__emitChange();
};

PokemonStore.all = function(){
  var pokemons = [];
  var ids = Object.keys(_pokemons);

  for (var i = 1; i < ids.length; i++) {
    pokemons.push(_pokemons[i]);
  }

  return pokemons;
};

PokemonStore.find = function(id) {
  return _pokemons[id];
};

PokemonStore.__onDispatch = function(payload){
  switch (payload.actionType) {
    case PokemonConstants.POKEMONS_RECEIVED:
      resetPokemons(payload.pokemons);
      break;

    case PokemonConstants.POKEMON_RECEIVED:
      resetPokemon(payload.pokemon);
      break;
    default:

  }
};

module.exports = PokemonStore;
