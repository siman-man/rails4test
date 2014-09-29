class ScreenController < ApplicationController
  def index
    room_name = 'room_' + params["screen"]["tag_name"]
    user_name = logged_in? ? current_user.nickname : 'Guest'

    @user_info = { user_name: user_name, room_name: room_name }
  end
end
