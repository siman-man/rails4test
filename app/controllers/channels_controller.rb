class ChannelsController < ApplicationController
  def index
    channels = { channels: REDIS.SMEMBERS('active_room_list') }

    respond_to do |format|
      format.html
      format.json { render json: channels.to_json }
    end
  end
end
