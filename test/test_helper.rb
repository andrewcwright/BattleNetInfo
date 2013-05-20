require 'test/unit'
require_relative '../bootstrap_ar'

#other test prep stuff goes here

module DatabaseCleaner
  def before_setup
    super
    Character.destroy_all
  end
end