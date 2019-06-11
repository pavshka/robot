# frozen_string_literal: true

require_relative 'constants'

class Table
  def initialize
    @width = Constants::TABLE_X_MAX
    @height = Constants::TABLE_Y_MAX
  end

  def valid_position?(x, y)
    (x >= 0 && x <= @width) &&
      (y >= 0 && y <= @height)
  end
end
