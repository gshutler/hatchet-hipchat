require 'hatchet-hipchat/version'
require 'hatchet'
require 'hipchat-api'

module Hatchet

  # Public: Class for sending log messages to a HipChat room.
  #
  class HipChatAppender
    include LevelManager

    # Interal: The class to use to create HipChat clients.
    #
    CLIENT = HipChat::API

    # Public: The formatter used to format messages before sending them to the
    # HipChat room.
    #
    attr_accessor :formatter

    # Public: The API token to use to connect to HipChat's API.
    #
    attr_accessor :api_token

    # Public: The ID of the room to send messages to.
    #
    attr_accessor :room_id

    # Public: Creates a new instance.
    #
    # By default the appender is created with a SimpleFormatter.
    #
    # block  - Optional block that can be used to customize the appender. The
    #          appender itself is passed to the block.
    #
    def initialize
      @formatter = SimpleFormatter.new
      yield self if block_given?
    end

    # Internal: Sends a message to HipChat if the appender is configured to send
    # messages at the given level for the given context.
    #
    # level   - The level of the message.
    # context - The context of the message.
    # message - The message to add to the appender if it is configured to log
    #           messages at the given level for the given context.
    #
    # Returns nothing.
    #
    def add(level, context, message)
      return unless enabled? level, context
      message = @formatter.format(level, context, message)
      client.rooms_message @room_id, 'Hatchet', message
    end

    # Internal: Returns the client used to send messages to HipChat.
    #
    def client
      @client ||= CLIENT.new(@api_token)
    end

  end

end