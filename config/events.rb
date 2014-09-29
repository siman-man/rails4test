WebsocketRails::EventMap.describe do
  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
  #
  # Uncomment and edit the next line to handle the client connected event:
  #   subscribe :client_connected, :to => Controller, :with_method => :method_name
  #
  # Here is an example of mapping namespaced events:
  #   namespace :product do
  #     subscribe :new, :to => ProductController, :with_method => :new_product
  #   end
  # The above will handle an event triggered on the client like `product.new`.
  
  # websocket_chatイベントのマッピング
  subscribe :websocket_screen, to: WebsocketScreenController, with_method: :message_recieve
  subscribe :client_connected, to: WebsocketScreenController, with_method: :client_connected
  subscribe :client_disconnected, to: WebsocketScreenController, with_method: :client_disconnected
  subscribe :watcher_enter, to: WebsocketScreenController, with_method: :watcher_enter
  subscribe :watcher_leave, to: WebsocketScreenController, with_method: :watcher_leave
end
