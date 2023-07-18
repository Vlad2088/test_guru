class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.sort_tests_by_category(title)
    joins(:category)
      .where(categories: { title: title})
      .order(title: :desc)
      .pluck(:title)
  end
end
