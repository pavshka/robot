require_relative 'command'
require_relative '../constants'

module Commands
  class Left < Command
    def execute!(robot)
      current_facing = robot.facing
      new_facing_index = Constants::Robot::FACINGS.index(current_facing) - 1
      robot.facing = Constants::Robot::FACINGS[new_facing_index]
    end
  end
end
