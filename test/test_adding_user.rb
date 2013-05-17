require test_helper

class TestAddingUser < Minitest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguements_and_saves_them
    assert_equal 0, User.count
    `bni add awright`
    assert_equal 1, User.count
  end
end