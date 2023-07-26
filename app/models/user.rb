class User < ApplicationRecord
  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  validates :email, presence: true, uniqueness: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end
