# frozen_string_literal: true

require_relative 'constants'
require_relative 'command_builder'
require_relative 'errors/robot_errors'

class CommandParser
  def initialize
    @initial_command_received = false
  end

  def parse(input)
    name, params = comment?(input) ? [Constants::Commands::COMMENT, ''] : input.split
    check_command_is_supported(name)

    CommandBuilder.build(name, params)
  end

  private

  def comment?(input)
    input =~ Constants::Commands::COMMENT_STRING_REGEXP
  end

  def check_command_is_supported(name)
    raise UnsupportedCommandError unless Constants::Commands::SUPPORTED_COMMANDS.include?(name)
  end
end
