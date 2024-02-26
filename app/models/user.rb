class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable,  and :omniauthable, :confirmable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable,
         :validatable
         

  has_many :create_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gist, dependent: :destroy
  has_many :user_badges
  has_many :badge, through: :user_badges, dependent: :destroy

  def tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
