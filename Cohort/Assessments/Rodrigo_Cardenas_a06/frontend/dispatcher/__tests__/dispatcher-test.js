"use strict";
jest.autoMockOff();

describe('Dispatcher', function() {
  var AppDispatcher;

  beforeEach(function() {
    AppDispatcher = require('../dispatcher.js');
  });

  it('sends actions to subscribers', function() {
    var listener = jest.genMockFunction();
    AppDispatcher.register(listener);

    var payload = {};
    AppDispatcher.dispatch(payload);
    expect(listener.mock.calls.length).toBe(1);
    expect(listener.mock.calls[0][0]).toBe(payload);
  });
});
