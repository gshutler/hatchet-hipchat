module Hatchet

  # Public: Formatter that outputs messages with HipChat emoticons in place of
  # the level.
  #
  # Mapping
  #
  #   :debug -> (content)
  #   :info  -> (wat)
  #   :warn  -> (ohcrap)
  #   :error -> (omg)
  #   :fatal -> (boom)
  #
  # Emoticon reference: http://hipchat-emoticons.heroku.com/
  #
  class HipChatEmoticonFormatter

    # Internal: Map for converting levels to emoticons.
    #
    LEVEL_EMOTICON_MAP = {
      debug: '(content)',
      info:  '(wat)',
      warn:  '(ohcrap)',
      error: '(omg)',
      fatal: '(boom)'
    }

    # Public: Returns the formatted message with HipChat emoticons in place of
    # the level.
    #
    # level   - The severity of the log message.
    # context - The context of the log message.
    # message - The message provided by the log caller.
    #
    # Mapping
    #
    #   :debug -> (content)
    #   :info  -> (wat)
    #   :warn  -> (ohcrap)
    #   :error -> (omg)
    #   :fatal -> (boom)
    #
    # Returns messages in the format:
    #
    #   LEVEL - CONTEXT - MESSAGE
    #
    def format(level, context, message)
      message = message.to_s.strip
      "#{LEVEL_EMOTICON_MAP[level]} - #{context} - #{message}"
    end

  end

end

