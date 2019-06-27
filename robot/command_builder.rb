require_relative 'constants'
require_relative 'errors/robot_errors'
require_relative 'commands/comment'
require_relative 'commands/left'
require_relative 'commands/move'
require_relative 'commands/place'
require_relative 'commands/report'
require_relative 'commands/right'


class CommandBuilder
  def self.build(name, params)
    {
      Constants::Commands::COMMENT => ->() { Commands::Comment.new },
      Constants::Commands::LEFT    => ->() { Commands::Left.new },
      Constants::Commands::MOVE    => ->() { Commands::Move.new },
      Constants::Commands::PLACE   => ->() { Commands::Place.new(params) },
      Constants::Commands::REPORT  => ->() { Commands::Report.new },
      Constants::Commands::RIGHT   => ->() { Commands::Right.new },
    }.fetch(name) {
      raise UnsupportedCommandError
    }.call
  end
end
