module Badges
  class CategoryRuleSpecification < BadgeSpecifications
    def success?
      category = @test.category_id

      Test.by_ids(@test_passage.test_passed_ids).by_category_id(category).count == Test.by_category_id(category).count
    end
  end
end
