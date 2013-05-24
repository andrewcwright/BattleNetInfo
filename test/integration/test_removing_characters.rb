require_relative '../test_helper'

class TestRemovingCharacter < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_remove_only_character
    Character.create(name: "Andose")
    `./bni remove Andose kelthuzad`
    assert Character.all.empty?
  end

  def test_remove_particular_character
    Character.create(name: "Andose")
    Character.create(name: "Infernae")
    Character.create(name: "Jellyxickle")
    assert !Character.where( name: 'Andose').all.empty?
    `./bni remove Andose`
    assert Character.where( name: 'Andose').all.empty?
    assert_equal 2, Character.count
  end

  def test_remove_particular_character_doesnt_remove_all
    assert Character.all.empty?
    Character.create(name: "Andose")
    Character.create(name: "Infernae")
    Character.create(name: "Jellyxickle")
    assert !Character.where( name: 'Infernae').all.empty?
    `./bni remove Infernae`
    assert_equal 2, Character.count
  end
end