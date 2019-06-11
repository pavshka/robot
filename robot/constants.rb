# frozen_string_literal: true

module Constants
  TABLE_X_MAX = 4
  TABLE_Y_MAX = 4

  FACINGS = [
    NORTH = 'NORTH',
    EAST = 'EAST',
    SOUTH = 'SOUTH',
    WEST = 'WEST'
  ].freeze

  SUPPORTED_COMMANDS = [
    PLACE_COMMAND = 'PLACE',
    MOVE_COMMAND = 'MOVE',
    LEFT_COMMAND = 'LEFT',
    RIGHT_COMMAND = 'RIGHT',
    REPORT_COMMAND = 'REPORT'
  ].freeze

  COMMENT_STRING_REGEXP = /^#/.freeze
  VALID_PLACE_PARAMS_REGEXP =
    /^[0-#{TABLE_X_MAX}],[0-#{TABLE_Y_MAX}],(#{FACINGS.join('|')})$/.freeze
end
