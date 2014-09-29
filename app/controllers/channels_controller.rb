class ChannelsController < ApplicationController
  def index

    respond_to do |format|
      format.html
      format.json { render json: "{\"x\":1,\"y\":2,\"z\":3}" }
    end
  end
end
