require_relative '../test_helper'
require 'date'

class TestTimeConverter < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_returns_accurate_time_conversion
    battle_net_api = BattleNetAPI.new("Andose", "kelthuzad")
    date_time = battle_net_api.time_converter(1369098339)
    assert_equal "Tue, 21 May 2013 01:05:39 +0000", date_time
  end

end