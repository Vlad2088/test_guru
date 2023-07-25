class User < ApplicationRecord
  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    tests.where(level: level)
  end
end
