class ScreenController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    room_name = 'room_' + params["screen"]["tag_name"]
    user_name = logged_in? ? current_user.nickname : 'Guest'
    @user_info = { user_name: user_name, room_name: room_name }

    gon.environment = ENV['RAILS_ENV']
    gon.user_info = @user_info
  end

  def stream
    render nothing: true
  end
end
