require 'test/unit'

class TestBNIIntegration < Test::Unit::TestCase

  def test_01_output_given_character_and_server
    block = <<-block
    Name: Andose
    Realm: Kel'Thuzad
    Battlegroup: Nightfall
    Class: 7
    Race: 3
    Gender: 0
    Level: 90
    Achievement Points: 8320
    block
    assert_equal(block, `ruby bni.rb andose kelthuzad`)
  end

end