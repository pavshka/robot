# frozen_string_literal: true

require_relative 'constants'
require_relative '../errors/command_parser_errors'

Command = Struct.new(:command, :params)

class CommandParser
  attr_accessor :initial_command_received

  def initialize
    @initial_command_received = false
  end

  def parse(input)
    return if comment?(input)

    command, params = input.split

    validate_place_command(params) if command == Constants::PLACE_COMMAND
    validate_command_is_supported(command)
    validate_initial_command_received

    Command.new(command, params)
  end

  private

  def comment?(input)
    input =~ Constants::COMMENT_STRING_REGEXP
  end

  def validate_command_is_supported(command)
    raise UnsupportedCommandError unless Constants::SUPPORTED_COMMANDS.include?(command)
  end

  def validate_place_command(params)
    raise InvalidCommandParamsError unless params =~ Constants::VALID_PLACE_PARAMS_REGEXP

    self.initial_command_received = true
  end

  def validate_initial_command_received
    raise InitialCommandNotReceivedError unless initial_command_received
  end
end
