module Badges
  class LevelRuleSpecification < BadgeSpecifications
    def success?
      level = @option
      return if @test.level != level.to_i

      Test.by_ids(@test_passage.test_passed_ids).by_level(level).count == Test.by_level(level).count
    end
  end
end
