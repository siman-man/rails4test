class ScreenController < ApplicationController
  def index
    @tag_name = params["screen"]["tag_name"]
    @data = { room_name: @tag_name, x: 1, y: 2, z: 'hello' }

    REDIS.incr @tag_name
  end
end
