require_relative 'command'
require_relative '../constants'

module Commands
  class Right < Command
    def execute!(robot)
      current_facing = robot.facing
      new_facing_index = (Constants::FACINGS.index(@facing) + 1) % Constants::FACINGS.size
      robot.facing = Constants::FACINGS[new_facing_index]
    end
  end
end
