jest.unmock('../serverActions.js');

describe('server actions', function () {
  var ServerActions,
      AppDispatcher,
      PostConstants,
      posts;

  beforeEach(function () {
    ServerActions = require('../serverActions.js');
    AppDispatcher = require('../../dispatcher/dispatcher.js');
    PostConstants = require('../../constants/postConstants');

    posts = [
      {
        id: 1,
        title: "Post1",
        body: "I am post 1"
      },
      {
        id: 2,
        title: "Post2",
        body: "I am post 2"
      }
    ];
  });

  it('receiveAll dispatches the correct data', function () {
    ServerActions.receiveAll(posts);
    expect(AppDispatcher.dispatch.mock.calls.length).toBe(1);

    var appDispatcherCallArg = AppDispatcher.dispatch.mock.calls[0][0];
    expect(appDispatcherCallArg.actionType).toEqual(PostConstants.POSTS_RECEIVED);
    expect(appDispatcherCallArg.posts).toEqual(posts);
  });

  it('receivePost dispatches the correct data', function () {
    ServerActions.receivePost(posts[0]);
    expect(AppDispatcher.dispatch.mock.calls.length).toBe(1);

    var appDispatcherCallArg = AppDispatcher.dispatch.mock.calls[0][0];
    expect(appDispatcherCallArg.actionType).toEqual(PostConstants.POST_RECEIVED);
    expect(appDispatcherCallArg.post).toEqual(posts[0]);
  });

  it('removePost dispatches the correct data', function () {
    ServerActions.removePost(posts[0]);
    expect(AppDispatcher.dispatch.mock.calls.length).toBe(1);

    var appDispatcherCallArg = AppDispatcher.dispatch.mock.calls[0][0];
    expect(appDispatcherCallArg.actionType).toEqual(PostConstants.POST_REMOVED);
    expect(appDispatcherCallArg.post).toEqual(posts[0]);
  });
});
