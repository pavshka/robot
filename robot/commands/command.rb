module Commands
  class Command
    def execute!(robot)
      raise StandardError, 'execute method should be defined on all command-inherrited classes'
    end

    def initial?
      false
    end
  end
end
