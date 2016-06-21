var ServerActions = require('../actions/serverActions');

module.exports = {
  fetchAllPokemons: function(){
    $.ajax({
      url: "api/pokemon",
      method: "GET",
      success: function(pokemons){
        ServerActions.receiveAllPokemons(pokemons);
      }
    });
  },

  fetchPokemon: function(id){
    $.ajax({
      url: "api/pokemon/" + id,
      method: "GET",
      success: function(pokemon){
        ServerActions.receivePokemon(pokemon);
      }
    });
  }
};
