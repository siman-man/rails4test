class ScreenController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    room_name = params["screen"]["tag_name"]
    user_name = logged_in? ? current_user.nickname : 'Guest'
    @user_info = { user_name: user_name, room_name: room_name }

    gon.environment = ENV['RAILS_ENV']
    gon.user_info = @user_info
  end

  def stream
    user = params['user']
    id = params["id"]
    hashtags = params['hashtags']
    text = params['text']
    image_url = user['profile_image_url']

    room_list = REDIS.SMEMBERS('active_room_list') & hashtags

    room_list.each do |room_name|
      WebsocketRails[room_name].trigger(room_name + '_timeline_update', { id: id, image_url: image_url, text: text })
    end

    render nothing: true
  end
end
