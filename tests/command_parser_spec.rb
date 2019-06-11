# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../robot/command_parser'

describe CommandParser do
  describe '#parse' do
    it 'skips the comments lines' do
      comment_string = '# Comment'
      assert_nil CommandParser.new.parse(comment_string)
    end

    it 'raises error if command is unsupported' do
      unsupported_command = 'UNSUPPORTED'
      assert_raises(UnsupportedCommandError) do
        CommandParser.new.parse(unsupported_command)
      end
    end

    it 'raises error if received command before initialization' do
      non_initial_command = Constants::REPORT_COMMAND
      assert_raises(InitialCommandNotReceivedError) do
        CommandParser.new.parse(non_initial_command)
      end
    end

    describe 'when correct PLACE command is received' do
      it 'sets initial_command_received to true' do
        correct_place_command = 'PLACE 1,1,NORTH'
        parser = CommandParser.new
        parser.parse(correct_place_command)

        assert(parser.initial_command_received)
      end
    end

    describe 'when incorrect arguments are provided with PLACE command' do
      it 'raises proper error' do
        out_of_border_coordinate = '-1,1,NORTH'

        assert_raises(InvalidCommandParamsError) do
          CommandParser.new.parse("PLACE #{out_of_border_coordinate}")
        end
      end

      it 'raises proper error' do
        out_of_border_coordinate = "1,#{Constants::TABLE_Y_MAX + 1},NORTH"

        assert_raises(InvalidCommandParamsError) do
          CommandParser.new.parse("PLACE #{out_of_border_coordinate}")
        end
      end

      it 'raises proper error' do
        unknown_direction = '0,0,UNKNOWN'

        assert_raises(InvalidCommandParamsError) do
          CommandParser.new.parse("PLACE #{unknown_direction}")
        end
      end
    end
  end
end
