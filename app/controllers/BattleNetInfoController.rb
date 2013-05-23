class BattleNetInfoController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def index
    characters = Character.all
    progressions = Progression.all
    characters.each_with_index do |character, i|
      puts "#{i+1}. #{character.name}"
      progressions.each do |progression|
        if progression.character_id == character.id
          puts "  * #{progression.name}"
        end
      end
    end
  end

  def create
    name = params[:character][:name]
    server = params[:character][:server]
    battle_net_api = BattleNetAPI.new(name, server)
    character_data = battle_net_api.format_character
    puts character_data
    character = Character.new(character_data)
    if character.save
      puts "Success!"
    else
      puts "Failure: #{character.errors.full_messages.join(", ")}"
    end
  end

  def destroy
    matching_characters = Character.where(name: params[:character][:name]).all
    matching_characters.each do |character|
      character.destroy
    end
  end

  def progression
    name = params[:character][:name]
    server = params[:character][:server]
    progression = params[:character][:progression]
    battle_net_api = BattleNetAPI.new(name, server, progression)
    progression_api_data = battle_net_api.format_progression
    progression_data = {
      "character_id" => Character.where(name: name).first.id,
      "name" => progression_api_data["name"],
      "lfrBossesKilled" => battle_net_api.num_kills("lfr"),
      "normalBossesKilled" => battle_net_api.num_kills("normal"),
      "heroicBossesKilled" => battle_net_api.num_kills("heroic")
    }
    progression_db = Progression.new(progression_data)
    puts progression_data
    if progression_db.save
      puts "Success!"
    else
      puts "Failure: #{progression_db.errors.full_messages.join(", ")}"
    end
  end

end