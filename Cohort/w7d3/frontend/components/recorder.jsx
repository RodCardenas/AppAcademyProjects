var React = require ('react'),
    OrganKey = require('./organ_key'),
    Track = require('../util/Track'),
    KeyStore = require('../stores/KeyStore');

var Recorder = React.createClass({

  getInitialState: function(){
    var newTrack = new Track({name: "newTrack"});
    return {isRecording: false, Track: newTrack};
  },

  componentDidMount: function(){
    this.listenerToken = KeyStore.addListener(this.addNotes);
  },

  componentWillUnmount: function(){
    this.listenerToken.remove();
  },

  startRecording: function(){
    this.state.Track.startRecording();
    this.setState({isRecording: true});
  },

  stopRecording: function(){
    this.state.Track.stopRecording();
    this.setState({isRecording: false});
  },

  play: function(){
    this.state.Track.play();
  },

  addNotes: function(){
    this.state.Track.addNotes(KeyStore.all());
  },

  render: function(){

    return (
      <div>
        <button onClick={this.startRecording} >Start Recording</button>
        <button onClick={this.stopRecording} >Stop Recording</button>
        <button onClick={this.play} >Play</button>
        <div>{this.state.isRecording ? "Recording" : ""} </div>
        <div>{this.state.Track.trackLength / 1000} secs</div>
      </div>
    );
  }

});

module.exports = Recorder;
