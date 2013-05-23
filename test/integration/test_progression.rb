require_relative '../test_helper'

class TestProgression < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguements_and_saves_them
    assert_equal 0, Progression.count
    `./bni add Andose kelthuzad`
    `./bni progression Andose kelthuzad "Throne of Thunder"`
    assert_equal 1, Progression.count
  end

  def test_takes_multiple_arguments
    `./bni add Andose kelthuzad`
    `./bni progression Andose kelthuzad "Throne of Thunder"`
    `./bni progression Andose kelthuzad "Dragon Soul"`
    assert_equal 'Dragon Soul', Progression.last.name
  end

  # def test_progression_associates_to_character
  #   `./bni add Andose kelthuzad`
  #   `./bni progression Andose kelthuzad "Throne of Thunder"`
  #   character_id = Character.where(name: "Andose").first.id
  #   progression_id = Progression.where(name: "Throne of Thunder", character_id: character_id).first.id
  #   assert_equal character_id, progression_id
  # end

end