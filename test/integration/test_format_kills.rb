require_relative '../test_helper'

class TestRemovingCharacter < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_format_kills_for_LFR
    battle_net_api = BattleNetAPI.new("Andose", "kelthuzad", "Dragon Soul")
    expected = "LFR Kills: 21 - Last Kill: Wed, 09 May 2012 19:28:01 +0000\n"
    progression = battle_net_api.format_progression
    bosses = progression['bosses'][0]
    actual = battle_net_api.format_kills('LFR', bosses)
    assert_equal expected, actual
  end

end