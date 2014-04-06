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
    include BacktraceFormatter

    # Internal: Map for converting levels to emoticons.
    #
    LEVEL_EMOTICON_MAP = {
      :debug => '(content)',
      :info  => '(wat)',
      :warn  => '(ohcrap)',
      :error => '(omg)',
      :fatal => '(boom)'
    }

    # Internal: The number of line to limit backtraces to by default.
    #
    DEFAULT_BACKTRACE_LIMIT = 4

    # Public: Creates a new instance.
    #
    def initialize(args = {})
      self.backtrace_limit = args.fetch(:backtrace_limit, DEFAULT_BACKTRACE_LIMIT)
    end

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
    #   LEVEL - CONTEXT NDC - MESSAGE
    #
    def format(level, context, message)
      msg = message.to_s.strip

      if message.ndc.any?
        msg = "#{LEVEL_EMOTICON_MAP[level]} - #{context} #{message.ndc.join(' ')} - #{msg}"
      else
        msg = "#{LEVEL_EMOTICON_MAP[level]} - #{context} - #{msg}"
      end

      with_backtrace(message, msg)
    end

  end

end

