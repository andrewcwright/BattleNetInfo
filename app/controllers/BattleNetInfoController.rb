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
    character = Character.new(params[:character])
    if character.save
      puts "Success!"
    else
      puts "Failure: #{character.errors.full_messages.join(", ")}"
    end
  end

  def destroy
    matching_projects = Project.where(name: params[:character][:name]).all
    matching_projects.each do |project|
      project.destroy
    end
  end

end