require_relative '../constants'
require_relative '../errors/robot_errors'
require_relative 'command'

module Commands
  class Move < Command
    def execute!(robot)
      new_position =
        case robot.facing
          when Constants::Robot::NORTH then [robot.x, robot.y + 1]
          when Constants::Robot::EAST  then [robot.x + 1, robot.y]
          when Constants::Robot::SOUTH then [robot.x, robot.y - 1]
          when Constants::Robot::WEST  then [robot.x - 1, robot.y]
        end

      new_x, new_y = new_position
      raise UnableToMoveError unless robot.valid_position?(new_x, new_y)

      robot.x = new_x
      robot.y = new_y
    end
  end
end
