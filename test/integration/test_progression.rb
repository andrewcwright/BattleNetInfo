require_relative '../test_helper'

class TestProgression < Minitest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguements_and_saves_them
    assert_equal 0, Progression.count
    `./bni progression Andose kelthuzad`
    assert_equal 1, Progression.count
  end

  def test_takes_multiple_arguments
    `./bni progression Andose kelthuzad`
    assert_equal 'Andose', Progression.last.name
  end

  # def test_duplicate_names_are_ignored
  #   `./bni progression Andose kelthuzad`
  #   original_project_count = Progression.count
  #   `./bni progression Andose kelthuzad`
  #   assert_equal original_project_count, Progression.count
  # end

  # def test_duplicate_names_output_error_message
  #   `./bni progression Andose kelthuzad "Throne of Thunder"`
  #   results = `./bni progression Andose kelthuzad "Throne of Thunder"`
  #   assert results.include?('Name must be unique'), "Actually was '#{results}'"
  end
end