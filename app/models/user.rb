class User < ApplicationRecord
  #has_and_belongs_to_many :tests

  def sorting_tests_by_level(level)
    Test.joins('INNER JOIN tests_users ON tests.id = tests_users.test_id')
      .joins('INNER JOIN users ON users.id = tests_users.user_id')
      .where('tests.level = ? AND users.id = ?', level, id)
  end
end
