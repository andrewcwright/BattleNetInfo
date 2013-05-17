require 'net/http'
require 'json'

class Character

  def initialize name, server
    @name = name
    @server = server
  end

  def get_character
    url = "http://us.battle.net/api/wow/character/#{@server}/#{@name}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/#{@server}/#{@name}")
    response = http.request(request)
    json_character = response.body
    parsed_character = JSON.parse(json_character)
    char_info = ""
    char_info << "Name: #{parsed_character["name"]}\n"
    char_info << "Realm: #{parsed_character["realm"]}\n"
    char_info << "Battlegroup: #{parsed_character["battlegroup"]}\n"
    char_info << "Class: #{parsed_character["class"]}\n"
    char_info << "Race: #{parsed_character["race"]}\n"
    char_info << "Gender: #{parsed_character["gender"]}\n"
    char_info << "Level: #{parsed_character["level"]}\n"
    char_info << "Achievement Points: #{parsed_character["achievementPoints"]}\n"
    char_info
  end

  def print_character
    puts get_character
  end

end

# if __FILE__ == $0
#   name = ARGV[0]
#   server = ARGV[1]
#   output = BNI.new(name, server)
#   output.print_character
# end