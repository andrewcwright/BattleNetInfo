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
Achievement Points: 8550
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
Achievement Points: 8550
********** Dragon Soul **********

Morchok:
LFR Kills: 21 - Last Kill: Wed, 09 May 2012 19:28:01 +0000
Normal Kills: 4 - Last Kill: Wed, 09 May 2012 19:28:01 +0000
Heroic Kills: 28 - Last Kill: Thu, 16 Aug 2012 01:49:26 +0000

Warlord Zon'ozz:
LFR Kills: 21 - Last Kill: Wed, 09 May 2012 19:40:28 +0000
Normal Kills: 13 - Last Kill: Wed, 09 May 2012 19:40:28 +0000
Heroic Kills: 20 - Last Kill: Thu, 16 Aug 2012 02:14:14 +0000

Yor'sahj the Unsleeping:
LFR Kills: 22 - Last Kill: Wed, 09 May 2012 19:56:10 +0000
Normal Kills: 11 - Last Kill: Wed, 09 May 2012 19:56:10 +0000
Heroic Kills: 22 - Last Kill: Thu, 16 Aug 2012 02:04:31 +0000

Hagara the Stormbinder:
LFR Kills: 21 - Last Kill: Wed, 09 May 2012 20:08:59 +0000
Normal Kills: 11 - Last Kill: Wed, 09 May 2012 20:08:59 +0000
Heroic Kills: 21 - Last Kill: Thu, 16 Aug 2012 02:23:09 +0000

Ultraxion:
LFR Kills: 15 - Last Kill: Mon, 07 May 2012 22:45:43 +0000
Normal Kills: 12 - Last Kill: Mon, 07 May 2012 22:45:43 +0000
Heroic Kills: 21 - Last Kill: Thu, 16 Aug 2012 02:33:22 +0000

Warmaster Blackhorn:
LFR Kills: 14 - Last Kill: Mon, 07 May 2012 23:03:22 +0000
Normal Kills: 14 - Last Kill: Mon, 07 May 2012 23:03:22 +0000
Heroic Kills: 18 - Last Kill: Thu, 16 Aug 2012 02:41:11 +0000

Spine of Deathwing:
LFR Kills: 12 - Last Kill: Fri, 30 Mar 2012 17:08:42 +0000
Normal Kills: 15 - Last Kill: Mon, 30 Apr 2012 02:52:40 +0000
Heroic Kills: 16 - Last Kill: Thu, 16 Aug 2012 02:54:35 +0000

Madness of Deathwing:
LFR Kills: 12 - Last Kill: Fri, 30 Mar 2012 17:24:54 +0000
Normal Kills: 15 - Last Kill: Mon, 07 May 2012 04:52:13 +0000
Heroic Kills: 14 - Last Kill: Thu, 16 Aug 2012 03:22:09 +0000

    EOS
    assert_equal(block, `./bni Andose kelthuzad "Dragon Soul"`)
  end

end