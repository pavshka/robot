# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'
require_relative '../robot/robot'

describe Robot do
  it 'correctly passes the first example' do
    expected_output = "0,1,NORTH\n"
    assert_output(expected_output) { Robot.new('examples/a.txt').run }
  end

  it 'correctly passes the second example' do
    expected_output = "0,0,WEST\n"
    assert_output(expected_output) { Robot.new('examples/b.txt').run }
  end

  it 'correctly passes the third example' do
    expected_output = "3,3,NORTH\n"
    assert_output(expected_output) { Robot.new('examples/c.txt').run }
  end
end
