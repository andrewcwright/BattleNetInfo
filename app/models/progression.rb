class Progression < ActiveRecord::Base
  belongs_to :post
  validates_uniqueness_of :name, :scope => :character_id, message: " / Raid combination must be unique"
end