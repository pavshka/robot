# frozen_string_literal: true

require_relative 'constants'

class Table
  include Constants::Table
  def initialize(width: DEFAULT_TABLE_WIDTH, height: DEFAULT_TABLE_HEIGHT)
    @width = width
    @height = height
  end

  def valid_position?(x, y)
    (x >= 0 && x <= @width) &&
      (y >= 0 && y <= @height)
  end
end
