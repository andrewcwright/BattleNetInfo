require_relative '../test_helper'

class TestRemovingCharacter < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_remove_only_character
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    `./bni remove Andose kelthuzad`
    assert Character.all.empty?
  end

  def test_remove_particular_character
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    Character.create(name: "Infernae", realm: "Kel'Thuzad")
    Character.create(name: "Jellyxickle", realm: "Kel'Thuzad")
    assert !Character.where( name: 'Andose', realm: "Kel'Thuzad").all.empty?
    `./bni remove Andose kelthuzad`
    assert Character.where( name: 'Andose', realm: "Kel'Thuzad").all.empty?
    assert_equal 2, Character.count
  end

  def test_remove_particular_character_doesnt_remove_all
    assert Character.all.empty?
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    Character.create(name: "Infernae", realm: "Kel'Thuzad")
    Character.create(name: "Jellyxickle", realm: "Kel'Thuzad")
    assert !Character.where( name: 'Infernae', realm: "Kel'Thuzad").all.empty?
    `./bni remove Infernae kelthuzad`
    assert_equal 2, Character.count
  end
end