# frozen_string_literal: true

require 'logger'

require_relative 'constants'
require_relative 'table'
require_relative 'command_parser'

require_relative 'errors/robot_errors'

class Robot
  attr_accessor :x, :y, :facing, :initial_command_received
  attr_reader :repl_mode, :file, :parser, :logger, :table

  def initialize(source = :repl)
    @initial_command_received = false
    @repl_mode = source == :repl
    @file = File.open(source, 'r') unless @repl_mode

    @parser = CommandParser.new
    @logger = Logger.new(STDOUT)
    @table = Table.new
  end

  def run
    repl_mode ? execute_command_from_repl : execute_command_from_file
  end

  def execute_command_from_repl
    loop { parse_and_execute(gets) }
  end

  def execute_command_from_file
    file.each_line { |line| parse_and_execute(line) }
  end

  def parse_and_execute(line)
    command = parser.parse(line)
    raise InitialCommandNotReceivedError unless (initial_command_received || command.initial?)

    command.execute!(self)
  rescue RobotError => e
    logger.warn e.message
  end

  def valid_position?(x, y)
    table.valid_position?(x, y)
  end
end
