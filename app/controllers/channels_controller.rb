class ChannelsController < ApplicationController
  def index
    channels = { channels: REDIS.SMEMBERS('active_room_list') }

    respond_to do |format|
      format.html
      format.json { render json: channels.to_json }
    end
  end

  def keyword
    keywords = REDIS.SMEMBERS('active_room_list').map{|key| key.gsub!(/^room_/,'') }

    respond_to do |format|
      format.json { render json: keywords.to_json }
    end
  end
end
