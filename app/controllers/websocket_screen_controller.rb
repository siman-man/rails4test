class WebsocketScreenController < WebsocketRails::BaseController
  include ApplicationHelper

  def initialize_session
    puts "Session Initialized"
  end

  def message_recieve
    puts 'message_recieve'
    # クライアントからのメッセージを取得
    # recieve_message = message()

    # websocket_chatイベントで接続しているクライアントにブロードキャスト
  end

  def watcher_enter
    data = message
    room_name = data['room_name']
    user_name = data['user_name']

    puts "#{user_name} enter #{room_name}"

    # Roomにユーザを１人追加
    add_user(room_name, user_name)
    user_count = REDIS.llen(room_name)
    REDIS.sadd('active_room_list', room_name)

    event_name = room_name + '_count_update'

    WebsocketRails[room_name].trigger(event_name, "#{user_count}")
  end

  def watcher_leave
    data = message
    room_name = data['room_name']
    user_name = data['user_name']

    puts "#{user_name} leave #{room_name}"

    # Roomからuser_nameを削除
    remove_user(room_name, user_name)
    user_count = REDIS.llen(room_name)

    if user_count.zero?
      REDIS.srem('active_room_list', room_name)
    end

    event_name = room_name + '_count_update'

    WebsocketRails[room_name].trigger(event_name, "#{user_count}")
  end

  def client_connected
    # client_idの状態をonline状態にする
    REDIS.set(client_id, 'online')

    puts "Client Connected #{client_id}"
  end

  def client_disconnected
    # client_idの状態を削除する
    REDIS.del(client_id)

    puts "Client Disconnected #{client_id}"
  end

  private

  def add_user(room_name, user_name)
    REDIS.rpush(room_name, user_name)
  end

  def remove_user(room_name, user_name)
    REDIS.lrem(room_name, 1, user_name)
  end
end
