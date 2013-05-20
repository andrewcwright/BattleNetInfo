require_relative '../test_helper'

class TestListingCharacters < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_projects
    assert Character.all.empty?
    actual = `./bni list`
    assert_equal "", actual
  end

  def test_listing_multiple_characters
    Character.create(name: 'foo')
    Character.create(name: 'bar')
    actual = `./bni list`
    expected = <<EOS
1. foo
2. bar
EOS
    assert_equal expected, actual
  end
end