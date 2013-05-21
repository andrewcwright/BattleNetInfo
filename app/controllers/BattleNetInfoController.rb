class BattleNetInfoController
  attr_accessor :params

  def initialize params
    @params = params
  end

  def index
    characters = Character.all
    characters.each_with_index do |character, i|
      puts "#{i+1}. #{character.name}"
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

end