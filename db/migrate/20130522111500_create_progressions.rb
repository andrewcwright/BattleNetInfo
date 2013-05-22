class CreateProgressions < ActiveRecord::Migration
  def change
    create_table :progressions do |t|
      t.integer :character_id
      t.string :name
      t.integer :lfrBossesKilled
      t.integer :normalBossesKilled
      t.integer :heroicBossesKilled
    end
  end
end