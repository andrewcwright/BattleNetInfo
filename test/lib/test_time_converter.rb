require_relative '../test_helper'

class TestTimeConverter < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_returns_accurate_time_conversion
    battle_net_api = BattleNetAPI.new("Andose", "kelthuzad")
    date_time = battle_net_api.time_converter(1369098339)
    assert_equal "Mon, 20 May 2013 20:05:39 -0500", date_time
  end

end