var React = require ('react'),
    Note = require('../util/note'),
    KeyStore = require('../stores/KeyStore'),
    TONES = require('../constants/tones');

var OrganKey = React.createClass({
  getInitialState: function(){
    return {playing: false};
  },

  componentDidMount: function(){
    var freq = TONES[this.props.noteString];
    this.note = new Note(freq);
    this.listenerToken = KeyStore.addListener(this.togglePlay);
  },

  componentWillUnmount: function(){
    this.listenerToken.remove();
  },

  togglePlay: function(){
    if (KeyStore.all().indexOf(this.props.noteString) !== -1){
      this.note.start();
      this.setState({playing: true});
    } else {
      this.note.stop();
      this.setState({playing: false});
    }
  },

  render: function(){
    var onOff;

    if (this.state.playing){
      onOff = "keyOn";
    } else {
      onOff = "keyOff";
    }

    return (
      <div className={onOff} >{this.props.noteString}</div>
    );
  }
});

module.exports = OrganKey;
