class User < ApplicationRecord
  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    Test.joins('INNER JOIN tests_users ON tests.id = tests_users.test_id')
      .where(tests: { level: level}, tests_users: { user_id: id})
  end
end
