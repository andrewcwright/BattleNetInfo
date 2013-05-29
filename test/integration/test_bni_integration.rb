require_relative '../test_helper'

class TestBNIIntegration < MiniTest::Unit::TestCase

  def test_01_output_given_character_and_server
    block = <<-block
********** Andose **********
Realm: Kel'Thuzad
Battlegroup: Nightfall
Class: Shaman
Race: Dwarf
Gender: Male
Level: 90
Achievement Points: 8485
    block
    assert_equal(block, `./bni Andose kelthuzad`)
  end

  def test_progression_output
    block = <<-EOS
********** Andose **********
Realm: Kel'Thuzad
Battlegroup: Nightfall
Class: Shaman
Race: Dwarf
Gender: Male
Level: 90
Achievement Points: 8485
********** Dragon Soul **********

Morchok:
LFR Kills: 21 - Last Kill: Wed, 09 May 2012 14:28:01 -0500
Normal Kills: 4 - Last Kill: Wed, 09 May 2012 14:28:01 -0500
Heroic Kills: 28 - Last Kill: Wed, 15 Aug 2012 20:49:26 -0500

Warlord Zon'ozz:
LFR Kills: 21 - Last Kill: Wed, 09 May 2012 14:40:28 -0500
Normal Kills: 13 - Last Kill: Wed, 09 May 2012 14:40:28 -0500
Heroic Kills: 20 - Last Kill: Wed, 15 Aug 2012 21:14:14 -0500

Yor'sahj the Unsleeping:
LFR Kills: 22 - Last Kill: Wed, 09 May 2012 14:56:10 -0500
Normal Kills: 11 - Last Kill: Wed, 09 May 2012 14:56:10 -0500
Heroic Kills: 22 - Last Kill: Wed, 15 Aug 2012 21:04:31 -0500

Hagara the Stormbinder:
LFR Kills: 21 - Last Kill: Wed, 09 May 2012 15:08:59 -0500
Normal Kills: 6 - Last Kill: Mon, 07 May 2012 17:45:43 -0500
Heroic Kills: 21 - Last Kill: Wed, 15 Aug 2012 21:23:09 -0500

Ultraxion:
LFR Kills: 15 - Last Kill: Mon, 07 May 2012 17:45:43 -0500
Normal Kills: 12 - Last Kill: Mon, 07 May 2012 17:45:43 -0500
Heroic Kills: 21 - Last Kill: Wed, 15 Aug 2012 21:33:22 -0500

Warmaster Blackhorn:
LFR Kills: 14 - Last Kill: Mon, 07 May 2012 18:03:22 -0500
Normal Kills: 14 - Last Kill: Mon, 07 May 2012 18:03:22 -0500
Heroic Kills: 18 - Last Kill: Wed, 15 Aug 2012 21:41:11 -0500

Spine of Deathwing:
LFR Kills: 12 - Last Kill: Fri, 30 Mar 2012 12:08:42 -0500
Normal Kills: 15 - Last Kill: Sun, 29 Apr 2012 21:52:40 -0500
Heroic Kills: 16 - Last Kill: Wed, 15 Aug 2012 21:54:35 -0500

Madness of Deathwing:
LFR Kills: 12 - Last Kill: Fri, 30 Mar 2012 12:24:54 -0500
Normal Kills: 15 - Last Kill: Sun, 06 May 2012 23:52:13 -0500
Heroic Kills: 14 - Last Kill: Wed, 15 Aug 2012 22:22:09 -0500

    EOS
    assert_equal(block, `./bni Andose kelthuzad "Dragon Soul"`)
  end

end