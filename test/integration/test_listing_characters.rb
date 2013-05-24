require_relative '../test_helper'

class TestListingCharacters < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_projects
    assert Character.all.empty?
    actual = `./bni list`
    assert_equal "", actual
  end

  def test_listing_multiple_characters
    Character.create(name: 'Andose')
    Character.create(name: 'Jellyxickle')
    actual = `./bni list`
    expected = <<EOS
1. Andose
2. Jellyxickle
EOS
    assert_equal expected, actual
  end

  def test_listing_progressions
    Character.create(name: 'Andose', realm: "Kel'Thuzad")
    Character.create(name: 'Tacoz', realm: "Kel'Thuzad")
    `./bni progression Andose kelthuzad "Throne of Thunder"`
    `./bni progression Andose kelthuzad "Dragon Soul"`
    `./bni progression Tacoz kelthuzad "Throne of Thunder"`
    actual = `./bni list`
    expected = <<EOS
1. Andose
  * Throne of Thunder
  * Dragon Soul
2. Tacoz
  * Throne of Thunder
EOS
    assert_equal expected, actual
  end

end