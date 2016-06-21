var React = require("react");

var PokemonIndexItem = React.createClass({
  contextTypes: {
    router: React.PropTypes.object.isRequired
  },

  handleClick: function(event){
    this.context.router.push("pokemon/" + this.props.pokemon.id);
    // changes url
  },

  render: function(){
    return(
      <li className="poke-list-item" onClick={this.handleClick}>
        Name: {this.props.pokemon.name} <br />
        Pokemon-Type: {this.props.pokemon.poke_type}
      </li>
    );
  }
});

module.exports = PokemonIndexItem;
