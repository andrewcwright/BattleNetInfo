class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :lastModified
      t.string :name
      t.string :realm
      t.string :battlegroup
      t.integer :character_class
      t.integer :race
      t.integer :gender
      t.integer :level
      t.integer :achievementPoints
    end
  end
end