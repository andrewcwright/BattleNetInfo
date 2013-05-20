require_relative '../test_helper'

class TestAddingCharacter < Minitest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguements_and_saves_them
    assert_equal 0, Character.count
    `./bni add awright`
    assert_equal 1, Character.count
  end

  def test_takes_arguments_and_uses_them
    `./bni add awright`
    assert_equal 'awright', Character.last.name
  end

  def test_duplicate_names_are_ignored
    Character.create( name: 'awright' )
    original_project_count = Character.count
    `./bni add awright`
    assert_equal original_project_count, Character.count
  end

  def test_duplicate_names_output_error_message
    Character.create( name: 'awright' )
    results = `./bni add awright`
    assert results.include?('Name must be unique'), "Actually was '#{results}'"
  end
end