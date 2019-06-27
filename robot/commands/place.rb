require_relative 'command'
require_relative '../errors/robot_errors'
require_relative '../constants'

module Commands
  class Place < Command
    def initialize(params)
      @params = params
    end

    def initial?
      true
    end

    def execute!(robot)
      x, y, facing = validated_command_params
      raise UnableToPlaceError unless robot.valid_position?(x, y)

      robot.x = x
      robot.y = y
      robot.facing = facing
      robot.initial_command_received ||= true
    end

    def validated_command_params
      raw_x, raw_y, facing = @params.split(',')
      raise UnsupportedFacingError unless Constants::Robot::FACINGS.include?(facing)

      [Integer(raw_x), Integer(raw_y), facing]
    end
  end
end
