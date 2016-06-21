var React = require('react');
var PokemonStore = require("../../stores/pokemon");
var ClientActions = require ("../../actions/clientActions");

var PokemonDetail = React.createClass({
  getInitialState: function(){
    return {pokemon: {}};
  },

  componentDidMount: function(){
    ClientActions.fetchPokemon(parseInt(this.props.params.pokemonId));
    this.listener = PokemonStore.addListener(this.getStateFromStore);
  },

  componentWillReceiveProps: function(newProps){
    ClientActions.fetchPokemon(parseInt(newProps.params.pokemonId));
  },

  getStateFromStore: function(){
    var newPokemon = PokemonStore.find(parseInt(this.props.params.pokemonId));
    this.setState({pokemon: newPokemon});
  },

  render: function(){
    var poke = this.state.pokemon;
    var details;
    var moves;

    if(Object.keys(poke).length !== 0){
      moves = poke.moves.map(function(move, idx){
        return <li key={idx}>{move}</li>;
      });

      details =  <div className="detail">
                  {poke.name}<br />
                  Attack: {poke.attack}<br />
                  Defense: {poke.defense}<br />
                  Type: {poke.poke_type}<br />
                  <ul>Moves:
                    {moves}<br />
                  </ul>
                  <img src={poke.image_url}></img><br />

                </div>;
    } else {
      details = <div className="detail"></div>;
    }

    return(
      <div className="pokemon-detail-pane">
        {details}
      </div>
    );
  }
});

module.exports = PokemonDetail;
