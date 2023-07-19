class Test < ApplicationRecord
  #belongs_to :category
  #has_and_belongs_to_many :users

  def self.sort_tests_by_category(title)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', title)
      .order('tests.title DESC')
      .pluck(:title)
  end
end
