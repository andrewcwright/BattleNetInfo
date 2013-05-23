require "minitest/autorun"
require_relative '../bootstrap_ar'

connect_to 'test'

ENV['FP_ENV'] = 'test'

module DatabaseCleaner
  def before_setup
    super
    Character.destroy_all
    Progression.destroy_all
  end
end