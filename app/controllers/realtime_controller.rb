require 'sse/writer'
class RealtimeController < ApplicationController

  include ActionController::Live

  before_action :setup_stream

  def messages
    begin
      @redis.subscribe('new_message') do |on|
        on.message do |event, data|
          @stream.write(JSON.parse(data).to_json, :event => :new)
        end
      end
    ensure
      @stream.close
    end
  end

  private

  def setup_stream
    response.headers['Content-Type'] = 'text/event-stream'
    @redis  = Redis.new
    @stream = Sse::Writer.new(response.stream)
  end


end
