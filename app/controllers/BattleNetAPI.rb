require 'net/http'
require 'json'

class BattleNetAPI

  def initialize name, server, progression=nil
    @name = name
    @server = server
    @progression = progression
  end

  def get_character
    url = "http://us.battle.net/api/wow/character/#{@server}/#{@name}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/#{@server}/#{@name}")
    response = http.request(request)
    json_character = response.body
    parsed_character = JSON.parse(json_character)
    parsed_character['character_class'] = parsed_character['class']
    parsed_character.delete('class')
    parsed_character.delete('thumbnail')
    parsed_character.delete('calcClass')
    parsed_character
  end

  def format_character
    classes = [
      "Warrior", "Paladin", "Hunter", "Rogue", "Priest", "Death Knight",
      "Shaman", "Mage", "Warlock", "Monk", "Druid"
    ]
    races = {
      1 => "Human", 2 => "Orc", 3 => "Dwarf", 4 => "Night Elf", 5 => "Undead",
      6 => "Tauren", 7 => "Gnome", 8 => "Troll", 9 => "Goblin", 10 => "Blood Elf",
      11 => "Draenei", 22 => "Worgen", 24 => "Neutral Pandaren",
      25 => "Alliance Pandaren", 26 => "Horde Pandaren"
    }
    character = get_character
    character['character_class'] = classes[character['character_class']-1]
    character['race'] = races[character['race']]
    character['gender'] = 0 ? "Male" : "Female"
    character
  end

  def print_character
    character = format_character
    char_info = ""
    char_info << "Name: #{character["name"]}\n"
    char_info << "Realm: #{character["realm"]}\n"
    char_info << "Battlegroup: #{character["battlegroup"]}\n"
    char_info << "Class: #{character["character_class"]}\n"
    char_info << "Race: #{character["race"]}\n"
    char_info << "Gender: #{character["gender"]}\n"
    char_info << "Level: #{character["level"]}\n"
    char_info << "Achievement Points: #{character["achievementPoints"]}\n"
    puts char_info
  end

  def get_progression
    url = "http://us.battle.net/api/wow/character/#{@server}/#{@name}?fields=progression"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/#{@server}/#{@name}?fields=progression")
    response = http.request(request)
    json_character = response.body
    parsed_character = JSON.parse(json_character)
  end

  def format_progression
    progression_data = get_progression['progression']['raids']
    tot_progression = {}
    progression_entries = progression_data.length
    progression_entries.times do |index|
      if progression_data[index]['name'] == @progression
        tot_progression = progression_data[index]
      end
    end
    tot_progression
  end

  def print_progression
    puts format_progression
  end

end