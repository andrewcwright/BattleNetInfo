require 'net/http'
require 'json'

class BNI

  def initialize name, server
    @name = name
    @server = server
  end

  def get_character
    uri = URI.parse("http://us.battle.net/api/wow/character/" + @server + "/" + @name)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/" + @server + "/" + @name)
    response = http.request(request)
    json_character = response.body
    parsed_character = JSON.parse(json_character)
    return_string = ""
    return_string << "Name: #{parsed_character["name"]}\n"
    return_string << "Realm: #{parsed_character["realm"]}\n"
    return_string << "Battlegroup: #{parsed_character["battlegroup"]}\n"
    return_string << "Class: #{parsed_character["class"]}\n"
    return_string << "Race: #{parsed_character["race"]}\n"
    return_string << "Gender: #{parsed_character["gender"]}\n"
    return_string << "Battlegroup: #{parsed_character["battlegroup"]}\n"
    return_string << "Level: #{parsed_character["level"]}\n"
    return_string << "Achievement Points: #{parsed_character["achievementPoints"]}\n"
    return_string
  end

  def print_character
    puts get_character
  end

end

if __FILE__ == $0
  name = ARGV[0]
  server = ARGV[1]
  output = BNI.new(name, server)
  output.print_character
end