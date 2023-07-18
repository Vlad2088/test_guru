class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def sorting_tests_by_level(level)
    tests.where(level: level)
  end
end
