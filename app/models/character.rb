class Character < ActiveRecord::Base
  has_many :progressions
  validates_uniqueness_of :name, :scope => :realm, message: "/ Server combination must be unique"
end