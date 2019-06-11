# frozen_string_literal: true

class RobotError < StandardError; end

class UnableToMoveError < RobotError
  def message
    'Facing the table border. Unable to move forward. Skipping the command'
  end
end
