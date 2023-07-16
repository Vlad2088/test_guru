class User < ApplicationRecord
  def sorting_tests_by_level(level)
    tests.where(level: level)
  end
end
