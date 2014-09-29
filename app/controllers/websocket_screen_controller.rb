class WebsocketScreenController < WebsocketRails::BaseController
  include ApplicationHelper

  def initialize_session
    puts "Session Initialized"
  end

  def message_recieve
    p 'message_recieve'
    # クライアントからのメッセージを取得
    # recieve_message = message()

    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    # WebSocketRails[:websocket_screen].trigger(:websocket_screen, message)
  end

  def watcher_enter
    p message
    p client_id
    p 'watchers_enter'
  end

  def watcher_leave
    p message
    p 'watchers_leave'
  end

  def client_connected
    puts "Client Connected #{client_id}"

    if logged_in?
      puts current_user.nickname
    else
      puts 'not login'
    end
  end

  def client_disconnected
    puts "Client Disconnected #{client_id}"
  end
end
