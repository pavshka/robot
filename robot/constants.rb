# frozen_string_literal: true

module Constants
  module Table
    DEFAULT_TABLE_WIDTH = 4
    DEFAULT_TABLE_HEIGHT = 4
  end

  module Robot
    FACINGS = [
      NORTH = 'NORTH',
      EAST = 'EAST',
      SOUTH = 'SOUTH',
      WEST = 'WEST'
    ].freeze
  end

  module Commands
    SUPPORTED_COMMANDS = [
      PLACE = 'PLACE',
      MOVE = 'MOVE',
      LEFT = 'LEFT',
      RIGHT = 'RIGHT',
      REPORT = 'REPORT',
      COMMENT = 'COMMENT'
    ].freeze

    COMMENT_STRING_REGEXP = /^#/.freeze
  end
end
