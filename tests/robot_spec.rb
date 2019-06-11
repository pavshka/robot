# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../robot/robot'
require_relative '../robot/constants'

describe Robot do
  describe '#execute_move_command' do
    describe 'out of table movement validation' do
      it 'raises error when robot tries to get far to north or east' do
        robot = Robot.new
        robot.x = Constants::TABLE_X_MAX
        robot.y = Constants::TABLE_Y_MAX

        robot.facing = Constants::NORTH
        assert_raises(UnableToMoveError) { robot.execute_move_command }

        robot.facing = Constants::EAST
        assert_raises(UnableToMoveError) { robot.execute_move_command }
      end

      it 'raises error when robot tries to get far to south or west' do
        robot = Robot.new
        robot.x = 0
        robot.y = 0

        robot.facing = Constants::SOUTH
        assert_raises(UnableToMoveError) { robot.execute_move_command }

        robot.facing = Constants::WEST
        assert_raises(UnableToMoveError) { robot.execute_move_command }
      end
    end
  end

  describe '#execute_left_command' do
    it 'turns robot 360 counter clockwise' do
      robot = Robot.new
      robot.facing = Constants::NORTH

      assert_equal(robot.execute_left_command, Constants::WEST)
      assert_equal(robot.execute_left_command, Constants::SOUTH)
      assert_equal(robot.execute_left_command, Constants::EAST)
      assert_equal(robot.execute_left_command, Constants::NORTH)
    end
  end

  describe '#execute_right_command' do
    it 'turns robot 360 clockwise' do
      robot = Robot.new
      robot.facing = Constants::NORTH

      assert_equal(robot.execute_right_command, Constants::EAST)
      assert_equal(robot.execute_right_command, Constants::SOUTH)
      assert_equal(robot.execute_right_command, Constants::WEST)
      assert_equal(robot.execute_right_command, Constants::NORTH)
    end
  end
end
