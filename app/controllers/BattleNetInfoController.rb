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
    character_name = params[:character][:name]
    server = params[:character][:server]
    progression = params[:character][:progression]
    battle_net_api = BattleNetAPI.new(character_name, server, progression)
    progression_api_data = battle_net_api.format_progression
    formatted_character = battle_net_api.format_character
    formatted_realm = formatted_character["realm"]
    if new_kills and Character.where(name: character_name, realm: formatted_realm).exists?
      this_character_id = Character.where(name: character_name, realm: formatted_realm).first.id
      new_lfr_kills = battle_net_api.num_kills('lfr')
      old_lfr_kills = Progression.where(name: character_name, character_id: this_character_id).first.lfrBossesKilled
      new_normal_kills = battle_net_api.num_kills('normal')
      old_normal_kills = Progression.where(name: character_name, character_id: this_character_id).first.normalBossesKilled
      new_heroic_kills = battle_net_api.num_kills('heroic')
      old_heroic_kills = Progression.where(name: character_name, character_id: this_character_id).first.heroicBossesKilled
      puts "Grats! You have killed #{new_lfr_kills - old_lfr_kills} new bosses in LFR"
      puts "Grats! You have killed #{new_normal_kills - old_normal_kills} new bosses in normal"
      puts "Grats! You have killed #{new_heroic_kills - old_heroic_kills} new bosses in heroic"
      Progression.where(name: character_name, character_id: this_character_id).first.destroy
    else
      puts "Sorry! You have not killed any new bosses, QQ"
    end
    progression_data = {
      "character_id" => Character.where("name = ? AND realm = ?", character_name, formatted_realm).first.id,
      "name" => progression_api_data["name"],
      "lfrBossesKilled" => battle_net_api.num_kills('lfr'),
      "normalBossesKilled" => battle_net_api.num_kills('normal'),
      "heroicBossesKilled" => battle_net_api.num_kills('heroic')
    }
    progression_db = Progression.new(progression_data)
    puts progression_data
    if progression_db.save
      puts "Success!"
    else
      puts "Failure: #{progression_db.errors.full_messages.join(", ")}"
    end
  end

  def new_kills
    character_name = params[:character][:name]
    server = params[:character][:server]
    progression = params[:character][:progression]
    battle_net_api = BattleNetAPI.new(character_name, server, progression)
    progression_api_data = battle_net_api.format_progression
    formatted_character = battle_net_api.format_character
    formatted_realm = formatted_character["realm"]
    if Character.where(name: character_name, realm: formatted_realm).exists?
      this_character_id = Character.where(name: character_name, realm: formatted_realm).first.id
      if Progression.where(name: character_name, character_id: this_character_id).exists?
        if battle_net_api.num_kills('lfr') > Progression.where(name: character_name, character_id: this_character_id).first.lfrBossesKilled
          return true
        elsif battle_net_api.num_kills('normal') > Progression.where(name: character_name, character_id: this_character_id).first.normalBossesKilled
          return true
        elsif battle_net_api.num_kills('heroic') > Progression.where(name: character_name, character_id: this_character_id).first.heroicBossesKilled
          return true
        end
      end
    end
    return false
  end

end