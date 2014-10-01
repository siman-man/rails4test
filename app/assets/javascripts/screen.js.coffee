# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  console.log('hello world')

  if gon.environment == "production"
    dispatcher = new WebSocketRails('twinama.herokuapp.com/websocket')
  else
    dispatcher = new WebSocketRails(location.host + '/websocket')

  room_name = gon.user_info.room_name
  channel = dispatcher.subscribe(room_name)

  # bind to a channel event
  channel.bind(room_name + '_count_update', (user_count) -> (
    console.log('channel event received: ' + user_count)
    $("#watchers").text(user_count)
  ));

  $(window).on('beforeunload', -> (
    dispatcher.trigger('watcher_leave', gon.user_info )
    return undefined
  ));

  dispatcher.trigger('watcher_enter', gon.user_info )
