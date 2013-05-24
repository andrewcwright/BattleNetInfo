require_relative '../test_helper'

class TestAddingCharacter < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguements_and_saves_them
    assert_equal 0, Character.count
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    assert_equal 1, Character.count
  end

  def test_takes_arguments_and_uses_them
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    assert_equal 'Andose', Character.last.name
  end

  def test_duplicate_names_are_ignored
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    original_project_count = Character.count
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    assert_equal original_project_count, Character.count
  end

  def test_duplicate_names_output_error_message
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    results = `./bni add Andose kelthuzad`
    assert results.include?('must be unique'), "Actually was '#{results}'"
  end

end