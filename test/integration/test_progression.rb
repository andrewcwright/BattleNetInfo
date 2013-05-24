require_relative '../test_helper'

class TestProgression < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_arguements_and_saves_them
    assert_equal 0, Progression.count
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    Progression.create(name: "Throne of Thunder")
    assert_equal 1, Progression.count
  end

  def test_takes_multiple_arguments
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    Progression.create(name: "Throne of Thunder")
    Progression.create(name: "Dragon Soul")
    assert_equal 'Dragon Soul', Progression.last.name
  end

  def test_progression_associates_to_character
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    character_table_id = Character.where(name: "Andose").last.id
    Progression.create(name: "Throne of Thunder", character_id: character_table_id)
    progression_table_id = Progression.where(name: "Throne of Thunder").last.character_id
    assert_equal character_table_id, progression_table_id
  end

  def test_multiple_progressions_associate_to_same_character
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    character_table_id = Character.where(name: "Andose").last.id
    Progression.create(name: "Throne of Thunder", character_id: character_table_id)
    Progression.create(name: "Dragon Soul", character_id: character_table_id)
    tot_progression = Progression.where(name: "Throne of Thunder").last.character_id
    ds_progression = Progression.where(name: "Dragon Soul").last.character_id
    assert_equal tot_progression, ds_progression
  end

  def test_progressions_relate_to_characters_with_same_name_but_different_servers
    Character.create(name: "Tacosofdeath", realm: "Kel'Thuzad")
    Character.create(name: "Tacosofdeath", realm: "Kargath")
    character_kt_id = Character.where(name: "Tacosofdeath", realm: "Kel'Thuzad").last.id
    character_kargath_id = Character.where(name: "Tacosofdeath", realm: "Kargath").last.id
    Progression.create(name: "Throne of Thunder", character_id: character_kt_id)
    Progression.create(name: "Throne of Thunder", character_id: character_kargath_id)
    tacos_kelthuzad_id = Character.where(name: "Tacosofdeath", realm: "Kel'Thuzad").last.id
    tacos_kargath_id = Character.where(name: "Tacosofdeath", realm: "Kargath").last.id
    tacos_kelthuzad_progression = Progression.where(name: "Throne of Thunder", character_id: tacos_kelthuzad_id).last.id
    tacos_kargath_progression = Progression.where(name: "Throne of Thunder", character_id: tacos_kargath_id).last.id
    assert(tacos_kargath_progression != tacos_kelthuzad_progression)
  end

  def test_duplicate_progressions_are_ignored
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    character_table_id = Character.where(name: "Andose").last.id
    Progression.create(name: "Throne of Thunder", character_id: character_table_id)
    original_project_count = Progression.count
    Progression.create(name: "Throne of Thunder", character_id: character_table_id)
    assert_equal original_project_count, Progression.count
  end

  def test_duplicate_duplicate_output_error_message
    Character.create(name: "Andose", realm: "Kel'Thuzad")
    character_table_id = Character.where(name: "Andose").last.id
    Progression.create(name: "Throne of Thunder", character_id: character_table_id)
    results = `./bni add Andose kelthuzad "Throne of Thunder"`
    assert results.include?('must be unique'), "Actually was '#{results}'"
  end

end