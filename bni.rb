if __FILE__ == $0
  character = ARGV[0]
  server = ARGV[1]
end

character_string = <<-BLOCK
   "lastModified":1368219272000,
   "name":"Andose",
   "realm":"Kel'Thuzad",
   "battlegroup":"Nightfall",
   "class":7,
   "race":3,
   "gender":0,
   "level":90,
   "achievementPoints":8320,
   "thumbnail":"kelthuzad/57/131738169-avatar.jpg",
   "calcClass":"W"
BLOCK

puts character_string