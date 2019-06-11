# frozen_string_literal: true

class CommandParserError < StandardError; end

class UnsupportedCommandError < CommandParserError
  def message
    'Command is not supported'
  end
end

class InitialCommandNotReceivedError < CommandParserError
  def message
    'Skipping command as you need to provide the PLACE command first'
  end
end

class InvalidCommandParamsError < CommandParserError
  def message
    'Wrong command arguments'
  end
end
