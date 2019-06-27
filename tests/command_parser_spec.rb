# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../robot/command_parser'

describe CommandParser do
  describe '#parse' do
    it 'raises error if command is unsupported' do
      unsupported_command = 'UNSUPPORTED'
      assert_raises(UnsupportedCommandError) do
        CommandParser.new.parse(unsupported_command)
      end
    end
  end
end
