module Badges
  class AttemptRuleSpecification < BadgeSpecifications
    def success?
      attempt = @option

      return unless @test_passage.passed?

      TestPassage.where(user: @user, test: @test).count == attempt.to_i

    end
  end
end
