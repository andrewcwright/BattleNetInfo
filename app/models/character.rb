class Character < ActiveRecord::Base
  has_many :progressions
  validates_uniqueness_of :name, message: "must be unique"
end