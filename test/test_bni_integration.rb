require 'test_helper'

class TestBNIIntegration < Test::Unit::TestCase

  def test_takes_arguments_and_saves_them
      # start with no projects
      assert_equal Project.count, 0
      # `ruby bni add foo`
      Project.create( name: 'foo' )
      # end up with a 'foo' project
      assert_equal Project.count, 1
  end

  def test_01_output_given_character_and_server
    block = <<-block
Name: Andose
Realm: Kel'Thuzad
Battlegroup: Nightfall
Class: 7
Race: 3
Gender: 0
Battlegroup: Nightfall
Level: 90
Achievement Points: 8320
    block
    assert_equal(block, `ruby models/bni.rb andose kelthuzad`)
  end

end