class WebsocketScreenController < WebsocketRails::BaseController
  def message_recieve
    # クライアントからのメッセージを取得
    recieve_message = message()

    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    broadcast_message(:websocket_screen, recieve_message)
  end
end
