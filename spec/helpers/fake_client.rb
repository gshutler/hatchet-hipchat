require 'ostruct'

class FakeClient

  attr_reader :api_token

  attr_reader :messages

  def initialize(api_token)
    @api_token = api_token
    @messages = []
  end

  def rooms_message(room_id, from, message, notify, color, format)
    @messages << OpenStruct.new(
      room_id: room_id, from: from, message: message, notify: notify,
      color: color, format: format)
  end

end

