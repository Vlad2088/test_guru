class Test < ApplicationRecord
  def self.sort_tests_by_category(title)
    includes(:category)
      .where(categories: { title: title})
      .order(title: :desc)
      .pluck(:title)
  end
end
