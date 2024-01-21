module Badges
  class CategoryRuleSpecification < BadgeSpecifications
    def success?
      catrgory = @test.catrgory_id

      Test.by_ids(@test_passage.test_passed_ids).by_category_id(category).count == Test.by_category_id(catrgory).count
    end
  end
end
