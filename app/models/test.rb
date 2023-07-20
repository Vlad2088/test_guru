class Test < ApplicationRecord
  def self.sort_tests_by_category(title)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title})
      .order(title: :desc)
      .pluck(:title)
  end
end
