require_relative '../test_helper'

class TestBNIIntegration < MiniTest::Unit::TestCase

  def test_01_output_given_character_and_server
    block = <<-block
********** Andose **********
Realm: Kel'Thuzad
Battlegroup: Nightfall
Class: Shaman
Race: Dwarf
Gender: Male
Level: 90
Achievement Points: 8400
    block
    assert_equal(block, `./bni Andose kelthuzad`)
  end

end