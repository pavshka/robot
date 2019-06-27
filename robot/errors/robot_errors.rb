# frozen_string_literal: true

class RobotError < StandardError; end

class UnableToMoveError < RobotError
  def message
    'Facing the table border. Unable to move forward. Skipping the command'
  end
end

class UnsupportedFacingError < RobotError
  def message
    'Specified facing is not supported. Skipping the command'
  end
end

class UnableToPlaceError < RobotError
  def message
    'Specified starting point is outside the table. Skipping the command'
  end
end

class UnsupportedCommandError < RobotError
  def message
    'Command is not supported'
  end
end

class InitialCommandNotReceivedError < RobotError
  def message
    'Skipping command as you need to provide the PLACE command first'
  end
end
