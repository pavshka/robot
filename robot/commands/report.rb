require_relative 'command'

module Commands
  class Report < Command
    def execute!(robot)
      puts "#{robot.x},#{robot.y},#{robot.facing}"
    end
  end
end
