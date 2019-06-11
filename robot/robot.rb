# frozen_string_literal: true

require 'logger'

require_relative 'constants'
require_relative 'table'
require_relative 'command_parser'

require_relative '../errors/robot_errors'
require_relative '../errors/command_parser_errors'

class Robot
  attr_accessor :x, :y, :facing
  attr_reader :repl_mode, :file, :parser, :logger, :table

  def initialize(source = :repl)
    @repl_mode = source == :repl
    @file = File.open(source, 'r') unless @repl_mode

    @parser = CommandParser.new
    @logger = Logger.new(STDOUT)
    @table = Table.new
  end

  def run
    repl_mode ? execute_from_repl : execute_from_file
  end

  def execute_from_repl
    loop { parse_and_execute(gets) }
  end

  def execute_from_file
    file.each_line { |line| parse_and_execute(line) }
  end

  def parse_and_execute(line)
    command = parser.parse(line)
    return unless command

    execute_command(command)
  rescue CommandParserError, RobotError => e
    logger.warn e.message
  end

  def execute_command(command)
    case command.command
    when Constants::PLACE_COMMAND  then execute_place_command(command.params)
    when Constants::MOVE_COMMAND   then execute_move_command
    when Constants::LEFT_COMMAND   then execute_left_command
    when Constants::RIGHT_COMMAND  then execute_right_command
    when Constants::REPORT_COMMAND then execute_report_command
    end
  end

  def execute_place_command(params)
    raw_x, raw_y, facing = params.split(',')

    self.x = Integer(raw_x)
    self.y = Integer(raw_y)
    self.facing = facing
  end

  def execute_move_command
    new_position =
      case facing
      when Constants::NORTH then [x, y + 1]
      when Constants::EAST  then [x + 1, y]
      when Constants::SOUTH then [x, y - 1]
      when Constants::WEST  then [x - 1, y]
      end

    raise UnableToMoveError unless table.valid_position?(*new_position)

    self.x, self.y = new_position
  end

  def execute_left_command
    new_index = Constants::FACINGS.index(@facing) - 1
    @facing = Constants::FACINGS[new_index]
  end

  def execute_right_command
    # looping throught the array. ex. array size = 4: after 3rd index (3+1) % 4 = 0
    new_index = (Constants::FACINGS.index(@facing) + 1) % Constants::FACINGS.size
    @facing = Constants::FACINGS[new_index]
  end

  def execute_report_command
    puts "#{x},#{y},#{facing}"
  end
end
