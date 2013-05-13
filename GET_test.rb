require 'net/http'

uri = URI.parse("http://us.battle.net/api/wow/character/kelthuzad/Andose")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new("/api/wow/character/kelthuzad/Andose")
response = http.request(request)
puts response.body
