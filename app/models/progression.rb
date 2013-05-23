class Progression < ActiveRecord::Base
  belongs_to :post
  # validates_uniqueness_of :name, message: "must be unique"
end