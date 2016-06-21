var React = require ('react'),
    OrganKey = require('./organ_key'),
    Recorder = require('./recorder');

var Organ = React.createClass({

  render: function(){
    return (
      <div>
        <OrganKey className='key' noteString = 'A4' />
        <OrganKey className='key' noteString = 'C4' />
        <OrganKey className='key' noteString = 'D4' />
        <OrganKey className='key' noteString = 'E4' />
        <OrganKey className='key' noteString = 'F4' />
        <OrganKey className='key' noteString = 'G4' />
        <Recorder />
      </div>
    );
  }

});

module.exports = Organ;
