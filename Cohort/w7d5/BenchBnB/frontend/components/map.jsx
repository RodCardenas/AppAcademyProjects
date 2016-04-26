var React = require('react');
var ApiUtil = require('../util/api_util');
var BenchStore = require('../stores/bench_store.js');
var HoveredBenchStore = require('../stores/hovered_bench_store.js');

var Map = React.createClass({
  getInitialState: function(){
    this.markers = [];
    return ({
      benches: BenchStore.all(),
      hovered_bench: HoveredBenchStore.hoveredBench()
    });
  },

  componentDidMount: function(){
    this.initMap();

    this.listenerToken = BenchStore.addListener(this._onBenchesChange);
    this.listenerToken = HoveredBenchStore.addListener(this._onHoveredBenchChange);
  },

  componentWillUnmount: function(){
    this.listenerToken.remove();
  },

  _onBenchesChange: function(){
    this.setState({ benches: BenchStore.all() });
  },

  _onHoveredBenchChange: function(){
    var bench = HoveredBenchStore.hoveredBench();
    this.setState({ hovered_bench: bench });
  },

  initMap: function(){
    var mapDOMNode = this.refs.map;
    var mapOptions = {
      center: {lat: 37.7758, lng: -122.435},
      zoom: 13
    };
    /*global google b:true*/
    /*eslint no-undef: "error"*/
    this.map = new google.maps.Map(mapDOMNode, mapOptions);

    google.maps.event.addListener(this.map, 'idle', function() {

      var bounds = this.map.getBounds();
      var northEast =  bounds.getNorthEast();
      var southWest =  bounds.getSouthWest();

      var squareBound = {
        "northEast": { lat: northEast.lat(), lng: northEast.lng() },
        "southWest": { lat: southWest.lat(), lng: southWest.lng() }
      };

      ApiUtil.fetchBenches(squareBound);
    }.bind(this));
  },

  render: function(){
    var keys = Object.keys(this.state.benches);

    this.removeBenchMarkersOutOfBounds();

    return (
      <div className="map" ref="map">Map</div>
    );
  },

  removeBenchMarkersOutOfBounds: function(){
    var keys = Object.keys(this.state.benches);
    var self = this;

    this.deleteMarkers();

    if( keys.length !== 0 ){
      var benches = keys.map(function(benchId){
        var bench = self.state.benches[benchId];
        var location = {lat: bench.lat, lng: bench.lng};
        var highlight = (bench.id === self.state.hovered_bench.id);

        self.addMarker(location, bench.description, highlight);
        return;
      });
    }
  },

  // Adds a marker to the map and push to the array.
   addMarker: function(location, title, highlight) {

    var marker = new google.maps.Marker({
      position: location,
      title: title
    });

    if(highlight){
      console.log("setting animation");
      marker.setAnimation(google.maps.Animation.BOUNCE);
    } else {
      marker.setAnimation(null);
    }
    marker.setMap(this.map);
    this.markers.push(marker);
  },

  // Sets the map on all markers in the array.
  setMapOnAll: function(map) {
    for (var i = 0; i < this.markers.length; i++) {
      this.markers[i].setMap(map);
    }
  },

  // Removes the markers from the map, but keeps them in the array.
  clearMarkers: function() {
    this.setMapOnAll(null);
  },

  // Shows any markers currently in the array.
  showMarkers: function() {
    this.setMapOnAll(this.map);
  },

  // Deletes all markers in the array by removing references to them.
  deleteMarkers: function() {
    this.clearMarkers();
    this.markers = [];
  }

});

module.exports = Map;
